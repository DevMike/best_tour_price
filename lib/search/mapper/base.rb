class Search::Mapper::Base
  class NoMappingError < StandardError;
  end

  class << self

    def params_names
      %i(departure destination date_from date_to adults children age night_from night_to price_from price_to currency category meal hotel with_flight with_hotel)
    end

    def apply(params)
      mapped_hash = (params.keys & params_names).each_with_object({}) do |param, mapping|
        mapping.merge!(send("#{param}_mapper", params[param])) or raise NoMappingError.new(param)
      end

      base_search_url + mapped_hash.to_param
    end

    private

    def base_search_url
      raise NotImplementedError
    end

    def departure_mapper
      raise NotImplementedError
    end
  end
end
