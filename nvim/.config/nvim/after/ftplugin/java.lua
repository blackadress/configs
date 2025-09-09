vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

local vars = require("utils").VARS

local config = {
  cmd = { vars["JDTLS"] },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      implementationsCodeLens = { enabled = true },
      imports = {
        gradle = {
          enabled = true,
          wrapper = {
            enabled = true,
            checksums = {
              {
                sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                allowed = true,
              },
            },
          },
        },
      },
      import = {
        gradle = {
          enabled = true,
          wrapper = {
            enabled = true,
            checksum = {
              {
                sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                allowed = true,
              },
            },
          },
        },
      },
    },
  },

  init_options = {
    bundles = {},
    settings = {
      java = {
        implementationsCodeLens = { enabled = true },
        imports = {
          gradle = {
            enabled = true,
            wrapper = {
              enabled = true,
              checksums = {
                {
                  sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                  allowed = true,
                },
              },
            },
          },
        },
        import = {
          gradle = {
            enabled = true,
            wrapper = {
              enabled = true,
              checksum = {
                {
                  sha256 = "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
                  allowed = true,
                },
              },
            },
          },
        },
      },
    },
  },
}
require("jdtls").start_or_attach(config)
