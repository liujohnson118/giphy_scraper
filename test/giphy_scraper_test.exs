defmodule GiphyScraperTest do
  use ExUnit.Case, async: true
  import Mox

  alias GiphyScraper.GiphyImage

  setup :verify_on_exit!

  describe "search/1" do
    test "parses Giphy API data correctly" do
      # Define mock data
      mock_data = [
          %{
            "id" => "8A2ED9pfNIcdq",
            "url" => "https://giphy.com/gifs/real-housewives-of-orange-county-rhoc-lydia-mclaughlin-8A2ED9pfNIcdq",
            "username" => "fifa",
            "title" => "real housewives canada GIF"
          },
          %{
            "id" => "4UACZLrybpQsqaFcvy",
            "url" => "https://giphy.com/gifs/sendwishonline-canada-day-canadian-flag-4UACZLrybpQsqaFcvy",
            "username" => "sendwishonline",
            "title" => "Maple Leaf Love GIF by sendwishonline.com"
          }
        ]

      # Set up Mox to expect a call to `call/1`
      GiphyApiRequestMock
        |> expect(:call, fn _query -> mock_data end)

      # Expected result
      expected_result = [
        %GiphyImage{
          id: "8A2ED9pfNIcdq",
          url: "https://giphy.com/gifs/real-housewives-of-orange-county-rhoc-lydia-mclaughlin-8A2ED9pfNIcdq",
          username: "fifa",
          title: "real housewives canada GIF"
        },
        %GiphyImage{
          id: "4UACZLrybpQsqaFcvy",
          url: "https://giphy.com/gifs/sendwishonline-canada-day-canadian-flag-4UACZLrybpQsqaFcvy",
          username: "sendwishonline",
          title: "Maple Leaf Love GIF by sendwishonline.com"
        }
      ]

      # Perform the test
      assert GiphyScraper.search("Canada", GiphyApiRequestMock) == expected_result
    end
  end
end
