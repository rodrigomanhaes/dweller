module Places
  module City
    attr_reader :name, :population, :urban_population, :area

    def capital?
      @capital
    end

    private

    def city_hash=(hash)
      @city_hash = hash
      @name = @city_hash[:name]
      @population = @city_hash[:population].to_i
      @urban_population = @city_hash[:urban_population].to_i
      @area = @city_hash[:area].to_f
      @capital = @city_hash[:capital] == "true"
    end
  end
end
