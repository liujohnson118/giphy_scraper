ExUnit.start()

# Define the mock interface for Req.get!
defmodule ReqMock do
  @callback get!(String.t()) :: map()
end

# Mock the Req.get! function
Mox.defmock(ReqMock, for: ReqMock)
Mox.defmock(GiphyApiRequestMock, for: GiphyApiRequest)
