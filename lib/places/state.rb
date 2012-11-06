module Places
  module State

    attr_reader :name, :acronym, :region

    private

    def state_hash=(hash)
      @state_hash = hash
      @name = @state_hash[:name]
      @acronym = @state_hash[:acronym]
      @region = @state_hash[:region]
    end
  end
end
