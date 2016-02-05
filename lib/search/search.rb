class Search::Search
  class << self
    def perform(mapper, params)
      Curl.post(mapper.apply(params))
    end
  end
end