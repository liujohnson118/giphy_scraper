defmodule GiphyApiRequestTest do
  use ExUnit.Case, async: true

  test "call/1 returns a list of gifs limited to 25" do
    # Test the call function with the query "police"
    # If stub is working, we should see a test throwing an error about data not being correct.
    # But no error about data is thrown, and real API call seems to be going through as well.
    Req.Test.stub(GiphyApiRequest, fn conn ->
      Req.Test.json(conn, %{"data" => sample_gifs()})
    end)

    result = GiphyApiRequest.call("police")

    # Assert that the result is a list
    # assert is_list(result)

    # Assert that the list contains exactly 2 gifs, no more and no less
    assert length(GiphyApiRequest.call("police")) === 2

    # Assert that each gif in the list has the expected keys
    assert Enum.all?(result, fn gif ->
      Map.has_key?(gif, "id") &&
      Map.has_key?(gif, "url") &&
      Map.has_key?(gif, "title") &&
      Map.has_key?(gif, "username")
    end)
  end


  test "call/1 returns empty" do
    Req.Test.stub(GiphyApiRequest, fn conn ->
      Req.Test.json(conn, %{"data" => []})
    end)

    # Test the call function with bad query
    result = GiphyApiRequest.call("adkfjadkfjadkjfa")

    # Assert that the result is an empty list
    assert result === []
  end

  # Sample GIFs data
  # Was testing with mock above. Didn't work
  defp sample_gifs do
    [
      %{
        "type" => "gif",
        "id" => "RYjnzPS8u0jAs",
        "title" => "Car Chase Police GIF",
        "url" => "https://giphy_url_1.ca",
        "username" => "user_123"
      },
      %{
        "type" => "gif",
        "id" => "XJdk2Sk7F76jF",
        "title" => "Police Car GIF",
        "url" => "https://giphy_url_2.ca",
        "username" => "user_456"
      }
    ]
  end
end
