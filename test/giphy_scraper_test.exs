defmodule GiphyScraperTest do
  use ExUnit.Case, async: true

  alias GiphyScraper.GiphyImage

  describe "search/1" do
    test "parses Giphy API data correctly" do
      result = GiphyScraper.search("police")
      expected_result = [
        %GiphyScraper.GiphyImage{id: "id_1", url: "https://gif_1.ca", username: "user_123", title: "Car Chase Police GIF"},
        %GiphyScraper.GiphyImage{id: "id_2", url: "https://gif_2.ca", username: "user_456", title: "Car Chase Police GIF 2"}
      ]

      assert(result === expected_result)
    end
  end
end
