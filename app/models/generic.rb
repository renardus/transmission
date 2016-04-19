# This class is used as follows:
# For example to connect to a SQLite development database use the following config:
#   h = {:adapter=>"sqlite3", :pool=>5, :timeout=>5000, :database=>"db/development.sqlite3"}
#   Generic.establish_connection h
# And for example to get at the users table
#   Generic.table_name = "users"
#   records = Generic.all
#
# More generally you can do (but should not do because you can overwrite existing classes):
#   h = Generic.connection_config
#   Generic.connection.tables.each do |table|
#     next if table.match(/\Aschema_migrations\Z/)
#     klass = table.singularize.camelize.constantize
#     klass.establish_connection h
#     puts "#{klass.name} has #{klass.count} records"
#   end
class Generic < ActiveRecord::Base
  # With Generic.connection.tables you get an array of all table names. 
  # Note first establish_connection before doing this!
  def self.tables; connection.tables; end

  def self.generate(config_hash, table)
    Generic.establish_connection(config_hash)
    Generic.table_name = table
    Generic
  end
end
