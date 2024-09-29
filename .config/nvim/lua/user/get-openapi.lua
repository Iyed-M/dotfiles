local Job = require("plenary.job")

local function fetch_openapi_schema(url)
  ---@type  'wait' | 'success' | 'fail'
  local got_response = "wait"
  local response = ""

  local job = Job:new({
    command = "curl",
    args = { "-s", url },
    on_exit = function(j, return_val)
      if return_val == 0 then
        local result = table.concat(j:result(), "\n")
        got_response = "success"
        response = result
        -- You can further process the result here
      else
      end
    end,
  }):start()

  while true do
    if got_response == "success" then
      return response
    end
    if got_response == "fail" then
      return nil
    end
  end
end

local res = fetch_openapi_schema("localhost:3000/json")
if res then
  vim.print("GOT_RES", res)
end
