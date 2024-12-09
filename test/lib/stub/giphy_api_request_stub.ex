defmodule GiphyScraper.Test.Stub.GiphyApiRequestStub do
  @spec call(any()) :: [%{optional(<<_::16, _::_*8>>) => <<_::24, _::_*8>>}, ...]
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
