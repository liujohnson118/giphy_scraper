defmodule GiphyScraper.GiphyImageDataMatch do
  def parse([_ | _] = list) do
    Enum.map(list, &parse/1)
  end

  def parse(raw_giphy_data) do
    %GiphyScraper.GiphyImage{
      id: raw_giphy_data["id"],
      url: raw_giphy_data["url"],
      username: raw_giphy_data["username"],
      title: raw_giphy_data["title"]
    }
  end
end
