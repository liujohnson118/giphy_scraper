defmodule GiphyScraperTest do
  use ExUnit.Case, async: true

  alias GiphyScraper.GiphyImage

  describe "search/1" do
    test "parses Giphy API data correctly" do
      result = GiphyApiRequest.call("police")

      # Assert that the result is a list
      assert is_list(result)

      # Assert that the list contains exactly 25 gifs, no more and no less
      assert length(result) === 25  # Page size is 25

      # Assert that each gif in the list has the expected keys
      assert Enum.all?(result, fn gif ->
        Map.has_key?(gif, "id") &&
        Map.has_key?(gif, "url") &&
        Map.has_key?(gif, "title") &&
        Map.has_key?(gif, "username")
      end)
    end
  end
end
