-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- git clone https://github.com/Elv13/collision
require("collision")()
local brightness_widget = require("awesome-wm-widgets.brightness-widget.brightness")
local keyboard_layout = require("keyboard_layout")
-- local net_speed_widget = require("awesome-wm-widgets.net-speed-widget.net-speed")
local volume_widget = require("awesome-wm-widgets.volume-widget.volume")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
require("awful.hotkeys_popup.keys")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify(
    {
      preset = naughty.config.presets.critical,
      title = "Oops, there were errors during startup!",
      text = awesome.startup_errors
    }
  )
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal(
    "debug::error",
    function(err)
      -- Make sure we don't go into an endless error loop
      if in_error then
        return
      end
      in_error = true

      naughty.notify(
        {
          preset = naughty.config.presets.critical,
          title = "Oops, an error happened!",
          text = tostring(err)
        }
      )
      in_error = false
    end
  )
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "zenburn/theme.lua")
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "alacritty"
editor = os.getenv("EDITOR") or "nvim"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.spiral,
  awful.layout.suit.tile.bottom
}
-- }}}

-- {{{ Menu
-- Create a launcher widget and a main menu
myawesomemenu = {
  {
    "hotkeys",
    function()
      hotkeys_popup.show_help(nil, awful.screen.focused())
    end
  },
  {"manual", terminal .. " -e man awesome"},
  {"edit config", editor_cmd .. " " .. awesome.conffile},
  {"restart", awesome.restart},
  {
    "quit",
    function()
      awesome.quit()
    end
  }
}

mymainmenu =
  awful.menu(
  {
    items = {
      {"awesome", myawesomemenu, beautiful.awesome_icon},
      {"open terminal", terminal}
    }
  }
)

mylauncher =
  awful.widget.launcher(
  {
    image = beautiful.awesome_icon,
    menu = mymainmenu
  }
)

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- Keyboard map indicator and switcher
-- mykeyboardlayout = awful.widget.keyboardlayout()
local kbdcfg = keyboard_layout.kbdcfg()

kbdcfg.add_primary_layout("English", "us", "us")
kbdcfg.add_primary_layout("Spanish", "es", "es")
-- kbdcfg.add_primary_layout("English",  "us", "fcitx-keyboard-us")
-- kbdcfg.add_primary_layout("Spanish",  "es", "fcitx-keyboard-es")
-- kbdcfg.add_primary_layout("Japanese", "ja", "mozc")

kbdcfg.bind()

kbdcfg.widget:buttons(
  awful.util.table.join(
    awful.button(
      {},
      1,
      function()
        kbdcfg.switch_next()
      end
    ),
    awful.button(
      {},
      3,
      function()
        kbdcfg.menu:toggle()
      end
    )
  )
)

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Create a wibox for each screen and add it
local taglist_buttons =
  gears.table.join(
  awful.button(
    {},
    1,
    function(t)
      t:view_only()
    end
  ),
  awful.button(
    {modkey},
    1,
    function(t)
      if client.focus then
        client.focus:move_to_tag(t)
      end
    end
  ),
  awful.button({}, 3, awful.tag.viewtoggle),
  awful.button(
    {modkey},
    3,
    function(t)
      if client.focus then
        client.focus:toggle_tag(t)
      end
    end
  ),
  awful.button(
    {},
    4,
    function(t)
      awful.tag.viewnext(t.screen)
    end
  ),
  awful.button(
    {},
    5,
    function(t)
      awful.tag.viewprev(t.screen)
    end
  )
)

local tasklist_buttons =
  gears.table.join(
  awful.button(
    {},
    1,
    function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal("request::activate", "tasklist", {raise = true})
      end
    end
  ),
  awful.button(
    {},
    3,
    function()
      awful.menu.client_list({theme = {width = 250}})
    end
  ),
  awful.button(
    {},
    4,
    function()
      awful.client.focus.byidx(1)
    end
  ),
  awful.button(
    {},
    5,
    function()
      awful.client.focus.byidx(-1)
    end
  )
)

local function set_wallpaper(s)
  -- Wallpaper
  if beautiful.wallpaper then
    local wallpaper = beautiful.wallpaper
    -- If wallpaper is a function, call it with the screen
    if type(wallpaper) == "function" then
      wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(
  function(s)
    -- Wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(
      gears.table.join(
        awful.button(
          {},
          1,
          function()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          {},
          3,
          function()
            awful.layout.inc(-1)
          end
        ),
        awful.button(
          {},
          4,
          function()
            awful.layout.inc(1)
          end
        ),
        awful.button(
          {},
          5,
          function()
            awful.layout.inc(-1)
          end
        )
      )
    )
    -- Create a taglist widget
    s.mytaglist =
      awful.widget.taglist {
      screen = s,
      filter = awful.widget.taglist.filter.all,
      buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist =
      awful.widget.tasklist {
      screen = s,
      filter = awful.widget.tasklist.filter.currenttags,
      buttons = tasklist_buttons
    }

    -- Create the wibox
    s.mywibox = awful.wibar({position = "top", screen = s})

    -- Add widgets to the wibox
    s.mywibox:setup {
      layout = wibox.layout.align.horizontal,
      {
        -- Left widgets
        layout = wibox.layout.fixed.horizontal,
        mylauncher,
        s.mytaglist,
        s.mypromptbox
      },
      s.mytasklist, -- Middle widget
      {
        -- Right widgets
        layout = wibox.layout.fixed.horizontal,
        -- net_speed_widget(),
        kbdcfg,
        volume_widget({widget_type = "arc"}),
        brightness_widget(
          {
            type = "arc",
            program = "xbacklight",
            step = 6
          }
        ),
        wibox.widget.systray(),
        mytextclock,
        s.mylayoutbox
      }
    }
  end
)
-- }}}

-- {{{ Mouse bindings
root.buttons(
  gears.table.join(
    awful.button(
      {},
      3,
      function()
        mymainmenu:toggle()
      end
    ),
    awful.button({}, 4, awful.tag.viewnext),
    awful.button({}, 5, awful.tag.viewprev)
  )
)
-- }}}

-- {{{ Key bindings
globalkeys =
  gears.table.join(
  awful.key({modkey}, "s", hotkeys_popup.show_help, {description = "show help", group = "awesome"}),
  awful.key(
    {modkey, "Control"},
    "h",
    awful.tag.viewprev,
    {description = "view previous", group = "tag"}
  ),
  awful.key(
    {modkey, "Control"},
    "l",
    awful.tag.viewnext,
    {description = "view next", group = "tag"}
  ),
  awful.key({modkey}, "Escape", awful.tag.history.restore, {description = "go back", group = "tag"}),
  -- Ctrl + F1, F2, F3, F4 changes to tag
  awful.key(
    {"Control"},
    "F1",
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[1]
      if tag then
        tag:view_only()
      end
    end,
    {description = "view tag #1"}
  ),
  awful.key(
    {"Control"},
    "F2",
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[2]
      if tag then
        tag:view_only()
      end
    end,
    {description = "view tag #2"}
  ),
  awful.key(
    {"Control"},
    "F3",
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[3]
      if tag then
        tag:view_only()
      end
    end,
    {description = "view tag #3"}
  ),
  awful.key(
    {"Control"},
    "F4",
    function()
      local screen = awful.screen.focused()
      local tag = screen.tags[4]
      if tag then
        tag:view_only()
      end
    end,
    {description = "view tag #4"}
  ),
  -- media buttons
  awful.key(
    {modkey},
    "=",
    function()
      volume_widget:inc_small()
      -- os.execute("pactl set-sink-volume 0 +3%")
    end,
    {description = "increase volume with =", group = "media keys"}
  ),
  awful.key(
    {modkey},
    "-",
    function()
      volume_widget:dec_small()
      -- os.execute("pactl set-sink-volume 0 -3%")
    end,
    {description = "decrease volume with -", group = "media keys"}
  ),
  awful.key(
    {},
    "XF86AudioRaiseVolume",
    function()
      volume_widget:inc()
      -- os.execute("pactl set-sink-volume 0 +5%")
    end,
    {description = "increase volume", group = "media keys"}
  ),
  awful.key(
    {},
    "XF86AudioLowerVolume",
    function()
      volume_widget:dec()
      -- os.execute("pactl set-sink-volume 0 -5%")
    end,
    {description = "decrease volume", group = "media keys"}
  ),
  awful.key(
    {modkey},
    "Home",
    function()
      os.execute("playerctl play-pause")
    end,
    {description = "pause/play media", group = "media keys"}
  ),
  awful.key(
    {modkey},
    "Next",
    function()
      os.execute("playerctl next")
    end,
    {description = "next track on media", group = "media keys"}
  ),
  awful.key(
    {modkey},
    "Prior",
    function()
      os.execute("playerctl previous")
    end,
    {description = "previous track on media", group = "media keys"}
  ),
  awful.key(
    {},
    "XF86MonBrightnessUp",
    function()
      brightness_widget:inc()
      -- awful.util.spawn("xbacklight -inc 15")
    end,
    {description = "raise brightness", group = "media keys"}
  ),
  awful.key(
    {},
    "XF86MonBrightnessDown",
    function()
      brightness_widget:dec()
      -- awful.util.spawn("xbacklight -dec 15")
    end,
    {description = "decrease brightness", group = "media keys"}
  ),
  awful.key(
    {modkey, "Mod1"},
    "l",
    function()
      -- Shift-Alt to change keyboard layout
      kbdcfg.switch_next()
      -- awful.util.spawn("xbacklight -dec 15")
    end,
    {description = "change keyboard layout", group = "media keys"}
  ),
  awful.key(
    {modkey},
    "j",
    function()
      awful.client.focus.byidx(1)
    end,
    {description = "focus next by index", group = "client"}
  ),
  awful.key(
    {modkey},
    "k",
    function()
      awful.client.focus.byidx(-1)
    end,
    {description = "focus previous by index", group = "client"}
  ),
  -- awful.key(
  --   {modkey},
  --   "w",
  --   function()
  --     mymainmenu:show()
  --   end,
  --   {description = "show main menu", group = "awesome"}
  -- ),
  -- Layout manipulation
  awful.key(
    {modkey, "Shift"},
    "j",
    function()
      awful.client.swap.byidx(1)
    end,
    {description = "swap with next client by index", group = "client"}
  ),
  awful.key(
    {modkey, "Shift"},
    "k",
    function()
      awful.client.swap.byidx(-1)
    end,
    {description = "swap with previous client by index", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "j",
    function()
      awful.screen.focus_relative(1)
    end,
    {description = "focus the next screen", group = "screen"}
  ),
  awful.key(
    {modkey, "Control"},
    "k",
    function()
      awful.screen.focus_relative(-1)
    end,
    {description = "focus the previous screen", group = "screen"}
  ),
  awful.key(
    {modkey},
    "u",
    awful.client.urgent.jumpto,
    {description = "jump to urgent client", group = "client"}
  ),
  awful.key(
    {modkey},
    "Tab",
    function()
      awful.client.focus.history.previous()
      if client.focus then
        client.focus:raise()
      end
    end,
    {description = "go back", group = "client"}
  ),
  -- Standard program
  awful.key(
    {modkey},
    "Return",
    function()
      awful.spawn(terminal)
    end,
    {description = "open a terminal", group = "launcher"}
  ),
  awful.key(
    {modkey, "Control"},
    "r",
    awesome.restart,
    {description = "reload awesome", group = "awesome"}
  ),
  awful.key({modkey, "Shift"}, "q", awesome.quit, {description = "quit awesome", group = "awesome"}),
  awful.key(
    {modkey},
    "l",
    function()
      awful.tag.incmwfact(0.05)
    end,
    {description = "increase master width factor", group = "layout"}
  ),
  awful.key(
    {modkey},
    "h",
    function()
      awful.tag.incmwfact(-0.05)
    end,
    {description = "decrease master width factor", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "h",
    function()
      awful.tag.incnmaster(1, nil, true)
    end,
    {description = "increase the number of master clients", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "l",
    function()
      awful.tag.incnmaster(-1, nil, true)
    end,
    {description = "decrease the number of master clients", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "p",
    function()
      awful.tag.incncol(1, nil, true)
    end,
    {description = "increase the number of columns", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "0",
    function()
      awful.tag.incncol(-1, nil, true)
    end,
    {description = "decrease the number of columns", group = "layout"}
  ),
  awful.key(
    {modkey},
    "space",
    function()
      awful.layout.inc(1)
    end,
    {description = "select next", group = "layout"}
  ),
  awful.key(
    {modkey, "Shift"},
    "space",
    function()
      awful.layout.inc(-1)
    end,
    {description = "select previous", group = "layout"}
  ),
  awful.key(
    {modkey, "Control"},
    "n",
    function()
      local c = awful.client.restore()
      -- Focus restored client
      if c then
        c:emit_signal("request::activate", "key.unminimize", {raise = true})
      end
    end,
    {description = "restore minimized", group = "client"}
  ),
  -- Prompt
  awful.key(
    {modkey},
    "r",
    function()
      awful.util.spawn("dmenu_run")
    end,
    {description = "run dmenu", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "w",
    function()
      -- awful.util.spawn("nitrogen --set-zoom-fill --random /usr/share/backgrounds/wallpapers-2018/")
      awful.util.spawn(
        "nitrogen --set-zoom-fill --random /mnt/particion_ntfs/imagenes/wp-long-monitor/"
      )
    end,
    {description = "change wallpaper randomly", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "b",
    function()
      awful.util.spawn("firefox")
    end,
    {description = "change wallpaper randomly", group = "launcher"}
  ),
  awful.key(
    {modkey},
    "x",
    function()
      awful.prompt.run {
        prompt = "Run Lua code: ",
        textbox = awful.screen.focused().mypromptbox.widget,
        exe_callback = awful.util.eval,
        history_path = awful.util.get_cache_dir() .. "/history_eval"
      }
    end,
    {description = "lua execute prompt", group = "awesome"}
  ),
  -- Menubar
  awful.key(
    {modkey},
    "p",
    function()
      menubar.show()
    end,
    {description = "show the menubar", group = "launcher"}
  )
)

clientkeys =
  gears.table.join(
  awful.key(
    {modkey},
    "f",
    function(c)
      c.fullscreen = not c.fullscreen
      c:raise()
    end,
    {description = "toggle fullscreen", group = "client"}
  ),
  awful.key(
    {modkey},
    "q",
    function(c)
      c:kill()
    end,
    {description = "close", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "space",
    awful.client.floating.toggle,
    {description = "toggle floating", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "Return",
    function(c)
      c:swap(awful.client.getmaster())
    end,
    {description = "move to master", group = "client"}
  ),
  awful.key(
    {modkey},
    "o",
    function(c)
      c:move_to_screen()
    end,
    {description = "move to screen", group = "client"}
  ),
  awful.key(
    {modkey},
    "t",
    function(c)
      c.ontop = not c.ontop
    end,
    {description = "toggle keep on top", group = "client"}
  ),
  awful.key(
    {modkey},
    "n",
    function(c)
      -- The client currently has the input focus, so it cannot be
      -- minimized, since minimized clients can't have the focus.
      c.minimized = true
    end,
    {description = "minimize", group = "client"}
  ),
  awful.key(
    {modkey},
    "m",
    function(c)
      c.maximized = not c.maximized
      c:raise()
    end,
    {description = "(un)maximize", group = "client"}
  ),
  awful.key(
    {modkey, "Control"},
    "m",
    function(c)
      c.maximized_vertical = not c.maximized_vertical
      c:raise()
    end,
    {description = "(un)maximize vertically", group = "client"}
  ),
  awful.key(
    {modkey, "Shift"},
    "m",
    function(c)
      c.maximized_horizontal = not c.maximized_horizontal
      c:raise()
    end,
    {description = "(un)maximize horizontally", group = "client"}
  )
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
  globalkeys =
    gears.table.join(
    globalkeys,
    -- View tag only.
    awful.key(
      {modkey},
      "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end,
      {description = "view tag #" .. i, group = "tag"}
    ),
    -- Toggle tag display.
    awful.key(
      {modkey, "Control"},
      "#" .. i + 9,
      function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end,
      {description = "toggle tag #" .. i, group = "tag"}
    ),
    -- Move client to tag.
    awful.key(
      {modkey, "Shift"},
      "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end,
      {description = "move focused client to tag #" .. i, group = "tag"}
    ),
    -- Toggle tag on focused client.
    awful.key(
      {modkey, "Control", "Shift"},
      "#" .. i + 9,
      function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end,
      {description = "toggle focused client on tag #" .. i, group = "tag"}
    )
  )
end

clientbuttons =
  gears.table.join(
  awful.button(
    {},
    1,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
    end
  ),
  awful.button(
    {modkey},
    1,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.move(c)
    end
  ),
  awful.button(
    {modkey},
    3,
    function(c)
      c:emit_signal("request::activate", "mouse_click", {raise = true})
      awful.mouse.client.resize(c)
    end
  )
)

-- Set keys
root.keys(globalkeys)
-- }}}
client.connect_signal(
  "manage",
  function(c)
    if c.class == nil then
      c.minimized = true
      c:connect_signal(
        "property::class",
        function()
          c.minimized = false
          awful.rules.apply(c)
        end
      )
    end
  end
)

-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {class = "firefox"},
    properties = {maximized = false}
  },
  {
    rule = {class = "discord"},
    properties = {
      maximized = false,
      floating = true,
      tag = "5"
    }
  },
  {
    rule = {class = "Anki"},
    properties = {
      maximized = false,
      floating = true
      -- tag = "6"
      -- switchtotag = true
    }
  },
  {
    rule = {class = "Spotify"},
    properties = {
      maximized = false,
      floating = false,
      tag = "4"
    }
  },
  {
    rule = {class = "vlc"},
    properties = {tag = "6"}
  },
  {
    rule = {class = "brave"},
    properties = {maximized = false}
  },
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen
    }
  },
  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
        "pinentry"
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin", -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"
      },
      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester" -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up" -- e.g. Google Chrome's (detached) Developer Tools.
      }
    },
    properties = {floating = true}
  }
  -- Set Firefox to always map on the tag named "2" on screen 1.
  -- {
  --   rule = {class = "Firefox"},
  --   properties = {screen = 1, tag = "2"}
  -- }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal(
  "manage",
  function(c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    if not awesome.startup then
      awful.client.setslave(c)
    end

    if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
    end
  end
)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal(
  "mouse::enter",
  function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
  end
)

client.connect_signal(
  "focus",
  function(c)
    c.border_color = beautiful.border_focus
  end
)
client.connect_signal(
  "unfocus",
  function(c)
    c.border_color = beautiful.border_normal
  end
)
-- }}}

-- GAPS
beautiful.useless_gap = 3
 beautiful.notification_icon_size = 70

-- autostart applications
awful.spawn.with_shell("picom -i 1.0")
awful.spawn.with_shell("key_remap")
-- awful.spawn.with_shell("nitrogen --set-zoom-fill --random /usr/share/backgrounds/wallpapers-2018/")
awful.spawn.with_shell(
  "nitrogen --set-zoom-fill --random /mnt/particion_ntfs/imagenes/wp-long-monitor/"
)
