module Places
  module State
    attr_reader :name, :acronym, :region

    class PlacesCity; include Places::City; end

    def cities
      @state_hash[:subregions].map do |city_hash|
        city = PlacesCity.new
        city.send "city_hash=", city_hash
        city
      end
    end

    def city(name)
      cities.find {|c| c.name == name }
    end

    private

    def state_hash=(hash)
      @state_hash = hash
      @name = @state_hash[:name]
      @acronym = @state_hash[:acronym]
      @region = @state_hash[:region]
    end
  end
end
