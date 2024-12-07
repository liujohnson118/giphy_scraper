defmodule GiphyApiRequestTest do
  use ExUnit.Case
  import Mox

  setup :verify_on_exit!

  # Setup to mock ReqMock
  # Mock doesn't really work. API request still going through.
  # setup do
  #   # Mock the ReqMock.get! function to return a predefined response structure
  #   Mox.stub(ReqMock, :get!, fn _url -> %{
  #     "body" => %{
  #       "data" => sample_gifs()
  #     }
  #   } end)
  #   :ok
  # end

  test "call/1 returns a list of gifs limited to 25" do
    # Test the call function with the query "police"
    result = GiphyApiRequest.call("police")

    # Assert that the result is a list
    assert is_list(result)

    # Assert that the list contains exactly 25 gifs, no more and no less
    assert length(result) === 25  # Page size is 25

    # Assert that each gif in the list has the expected keys
    assert Enum.all?(result, fn gif ->
      Map.has_key?(gif, "type") &&
      Map.has_key?(gif, "id") &&
      Map.has_key?(gif, "title") &&
      Map.has_key?(gif, "username")
    end)
  end


  test "call/1 returns empty" do
    # Test the call function with the query "police"
    result = GiphyApiRequest.call("adkfjadkfjadkjfa")

    # Assert that the result is an empty list
    assert result === []
  end

  # Sample GIFs data
  # Was testing with mock above. Didn't work
  # defp sample_gifs do
  #   [
  #     %{
  #       "type" => "gif",
  #       "id" => "RYjnzPS8u0jAs",
  #       "title" => "Car Chase Police GIF",
  #       "username" => "user_123"
  #     },
  #     %{
  #       "type" => "gif",
  #       "id" => "XJdk2Sk7F76jF",
  #       "title" => "Police Car GIF",
  #       "username" => "user_456"
  #     }
  #   ]
  # end
end
