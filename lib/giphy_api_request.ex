defmodule GiphyApiRequest do
  @callback call(String.t()) :: map()

  # MAX page size
  defp page_size, do: 25

  @moduledoc """
  Module for interfacing with GIPHY API
  """

  @doc """
  Fetches gifs data and re-organizing into list

  ## Examples

      iex> GiphyApiRequest.call("police")
      [
        %{
          "type" => "gif",
          "id" => "RYjnzPS8u0jAs",
          "title" => "Car Chase Police GIF",
          "username" => "user_123",
          ...
        }
      ]

  """
  def call(q) do
    Enum.take(get_gifs(q), page_size())
  end

  defp get_gifs(q) do
    Req.get!(build_url(q)).body["data"]
  end

  defp build_url(q) do
    "https://api.giphy.com/v1/gifs/search?#{query_string(q)}"
  end

  defp query_string(q) do
    URI.encode_query(
      %{
        "api_key" => System.get_env("GIPHY_API_KEY"),
        "q" => q
      }
    )
  end
end
