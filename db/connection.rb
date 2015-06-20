require "active_record"
require "yaml"
require "sqlite3"
require "logger"

data_base_configuration = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(data_base_configuration)
ActiveRecord::Base.logger = Logger.new(File.open("db/database.log", "w"))