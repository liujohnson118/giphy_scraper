defmodule GiphyScraper do
  @moduledoc """
  Fetch gifs data from GIPHY API and parsing into `GiphyScraper.GiphyImageDataMatch`
  """

  @doc """
  Search and parsing gifs

  ## Examples

      iex> GiphyScraper.search("Canada")
      [
        %GiphyScraper.GiphyImage{
          id: "8A2ED9pfNIcdq",
          url: "https://giphy.com/gifs/real-housewives-of-orange-county-rhoc-lydia-mclaughlin-8A2ED9pfNIcdq",
          username: "fifa",
          title: "real housewives canada GIF"
        },
        %GiphyScraper.GiphyImage{
          id: "4UACZLrybpQsqaFcvy",
          url: "https://giphy.com/gifs/sendwishonline-canada-day-canadian-flag-4UACZLrybpQsqaFcvy",
          username: "sendwishonline",
          title: "Maple Leaf Love GIF by sendwishonline.com"
        }
      ]
  """

  def search(query, api \\ GiphyApiRequest) do
    data = api.call(query)
    GiphyScraper.GiphyImageDataMatch.parse(data)
  end
end
