wrk.headers["Accept-Encoding"] = "gzip"

local thread

function setup(t)
  thread = t
end

function init(arg)
  body_size = 0
end

response = function(status, headers, body)
  if body_size == 0 then
    body_size = string.len(body)
  end
end

function done(summary, latency, requests)
  io.write(string.format("Response Size: %d\n", thread:get("body_size")))
end
