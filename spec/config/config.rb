require 'yaml'
require 'logger'
require 'active_record'
require 'active_support'
require 'sqlite3'
require 'rspec'
require 'database_cleaner'

# database creation
db_file = 'spec/config/db.sqlite3'
File.unlink(db_file) if File.exist?(db_file)
db = SQLite3::Database.new(db_file)
db.execute('''
create table paises (
  id integer,
  name char(200),
  gentilico char(200),
  gentilico_feminino char(200),
  primary key(id));
''')

# connection
ActiveRecord::Base.establish_connection(YAML::load(
  File.open(File.join(File.dirname(__FILE__), './database.yml'))))

ActiveSupport::Inflector.inflections do |inflect|
  inflect.plural /is$/i, 'ises'
  inflect.singular /ises$/i, 'is'
end

# logging
ActiveRecord::Base.logger = Logger.new(File.open('./spec/config/test.log', 'a'))

# database_cleaner configuration
DatabaseCleaner.app_root = "#{DatabaseCleaner.app_root}/spec"
DatabaseCleaner.strategy = :truncation

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end
end
