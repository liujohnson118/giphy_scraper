defmodule GiphyScraper.Test.Stub.GiphyApiRequestStub do
  def call(_) do
    [
      %{
        "type" => "gif",
        "id" => "id_1",
        "url" => "https://gif_1.ca",
        "title" => "Car Chase Police GIF",
        "username" => "user_123"
      },
      %{
        "type" => "gif",
        "id" => "id_2",
        "url" => "https://gif_2.ca",
        "title" => "Car Chase Police GIF 2",
        "username" => "user_456"
      }
    ]
  end
end
