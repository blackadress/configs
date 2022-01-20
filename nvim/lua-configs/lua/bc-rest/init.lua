local rest = require("rest-nvim")

rest.setup(
  {
    jump_to_request = false,
    result_split = {
      horizontal = false,
      in_place = true
    }
  }
)
