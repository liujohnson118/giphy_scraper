config :giphy_scraper, giphy_req_options: [
  plug: {Req.Test, GiphyApiRequest}
]
config :giphy_scraper, my_val: 555
