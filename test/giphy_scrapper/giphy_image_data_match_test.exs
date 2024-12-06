defmodule GiphyScraper.GiphyImageDataMatchTest do
  use ExUnit.Case, async: true

  alias GiphyScraper.GiphyImageDataMatch
  alias GiphyScraper.GiphyImage

  describe "parse/1" do
    test "parses a single raw Giphy data map into a GiphyImage struct" do
      raw_data = %{
        "id" => "abc123",
        "url" => "https://giphy.com/gifs/sample-abc123",
        "username" => "test_user",
        "title" => "Sample GIF"
      }

      expected_image = %GiphyImage{
        id: "abc123",
        url: "https://giphy.com/gifs/sample-abc123",
        username: "test_user",
        title: "Sample GIF"
      }

      assert GiphyImageDataMatch.parse(raw_data) == expected_image
    end

    test "parses a list of raw Giphy data maps into a list of GiphyImage structs" do
      raw_data_list = [
        %{
          "id" => "abc123",
          "url" => "https://giphy.com/gifs/sample-abc123",
          "username" => "test_user1",
          "title" => "Sample GIF 1"
        },
        %{
          "id" => "def456",
          "url" => "https://giphy.com/gifs/sample-def456",
          "username" => "test_user2",
          "title" => "Sample GIF 2"
        }
      ]

      expected_images = [
        %GiphyImage{
          id: "abc123",
          url: "https://giphy.com/gifs/sample-abc123",
          username: "test_user1",
          title: "Sample GIF 1"
        },
        %GiphyImage{
          id: "def456",
          url: "https://giphy.com/gifs/sample-def456",
          username: "test_user2",
          title: "Sample GIF 2"
        }
      ]

      assert GiphyImageDataMatch.parse(raw_data_list) == expected_images
    end
  end
end
