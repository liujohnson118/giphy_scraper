import Config

config :giphy_scraper, giphy_req_options: [
  plug: {Req.Test, GiphyApiRequest}
]

