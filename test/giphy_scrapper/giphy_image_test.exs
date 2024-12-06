defmodule GiphyScraper.GiphyImageTest do
  use ExUnit.Case, async: true

  alias GiphyScraper.GiphyImage

  describe "GiphyImage struct" do
    test "enforces required keys" do
      # Attempt to create a struct without required keys
      assert_raise ArgumentError, fn ->
        struct!(GiphyImage, %{})
      end

      assert_raise ArgumentError, fn ->
        struct!(GiphyImage, %{id: "test-id"})
      end
    end

    test "initializes correctly with all required keys" do
      id = "1234"
      url = "https://giphy.com/gifs/sample"
      username = "test_user"
      title = "Sample GIF"

      # Create a GiphyImage struct
      image = %GiphyImage{id: id, url: url, username: username, title: title}

      # Verify the struct fields
      assert image.id == id
      assert image.url == url
      assert image.username == username
      assert image.title == title
    end
  end
end
