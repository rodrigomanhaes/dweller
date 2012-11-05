require 'yaml'

module Places
  module Country
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def load_country(name)
        hash = YAML::load(File.read(File.expand_path(File.join(
          File.dirname(__FILE__), '..', '..', 'data', "#{name}.yml"))))
        country = self.new
        country.send "name=", hash[:name]
        country.send "international_name=", hash[:international_name]
        country.send "demonym=", hash[:demonym]
        country.send "female_demonym=", hash[:female_demonym]
        country.send "international_demonym=", hash[:international_demonym]
        country
      end
    end

    attr_reader :name, :international_name, :demonym, :female_demonym,
      :international_demonym

    private

    attr_writer :name, :international_name, :demonym, :female_demonym,
      :international_demonym
  end
end
