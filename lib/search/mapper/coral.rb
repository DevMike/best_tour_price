class Search::Mapper::Coral < Search::Mapper::Base

  class << self

    private

    def base_search_url
      'http://www.coraltravel.ua/SearchHotel.aspx'
    end

    def departure_mapper(value)
      mapped_value = case value
                     when 'Киев' then 140
                     when 'Днепропетровск' then 3111
                     when 'Запорожье' then 293
                     when 'Львов' then 3153
                     when 'Одесса' then 300
                     when 'Харьков' then 287
                     when 'Херсон' then 3134
                     end

      {FromArea: mapped_value}
    end
  end
end
