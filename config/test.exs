import Config

config :giphy_scraper, giphy_req_options: [
  plug:  { Req.Test, GiphyApiRequest }
]

config :giphy_scraper, giphy_api_request: GiphyScraper.Test.Stub.GiphyApiRequestStub
