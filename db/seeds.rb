# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

# Create the source origins (=classes)
#  Start with databases
#    A database has a name.
#    An Oracle database has a fixed adapter oracle_enhanced,
#    Either a host or a database (mutually exclusive)
#    Part database is a tns-name entry
#    Part host is a hostname/instance-name
#    username, password 
#  adapter: sqlite3
#  pool: 5
#  timeout: 5000
#
#  For an Oracle configuration see:
#    https://github.com/rsim/oracle-enhanced
puts "Databases"
dbsystem = Category.create(name: 'Databases', fertile: false)
  s = dbsystem.sources.create( name: 'Databases', fertile: false )
  puts "\tsqlite"
  sqlite = dbsystem.children.create(name: 'Sqlite', fertile: false)
  puts "\t\tsqlite parts"
    sqlite.parts.create( name: 'adapter', value_type: 'string', is_fixed: true,
                         default_value: 'sqlite3', is_required: true, is_in_row: false )
  puts "\t\tsqlite source"
    s.children.create(name: 'SQLite', remarks: 'Abstract Source', fertile: false, category_id: sqlite.id)
  puts "\tmysql"
  mysql = dbsystem.children.create(name: 'MySQL', fertile: false)
    mysql.parts.create( name: 'adapter', value_type: 'string', is_fixed: true,
                        default_value: 'mysql2', is_required: true, is_in_row: false )
    s.children.create(name: 'MySQL', remarks: 'Abstract Source', fertile: false, category_id: mysql.id)
  puts "\toracle"
  oracle = dbsystem.children.create(name: 'Oracle', fertile: false)
    oracle.parts.create( name: 'adapter', value_type: 'string', is_fixed: true,
                         default_value: 'oracle_enhanced', is_required: true, is_in_row: false )
    s.children.create(name: 'Oracle', remarks: 'Abstract Source', fertile: false, category_id: oracle.id)
  puts "\tmssql"
  mssql = dbsystem.children.create(name: 'MS SQL', fertile: false)
    mssql.parts.create( name: 'adapter', value_type: 'string', is_fixed: true,
                        default_value: 'sqlserver', is_required: true, is_in_row: false )
    s.children.create(name: 'MS SQL', remarks: 'Abstract Source', fertile: false, category_id: mssql.id)

  puts "\tServer"
db  = sqlite.children.create name: 'Server', fertile: true
  db.parts.create name: 'database', value_type: 'string', is_required: true, hint: 'filename', placeholder: 'db/file.sqlite3'
  db.parts.create name: 'timeout', value_type: 'integer', default_value: '5000'
  db.parts.create name: 'pool',    value_type: 'integer', default_value: '5'
 table = db.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', is_required: true, hint: 'table name'
  table.parts.create name: 'primary_key', value_type: 'string', hint: 'if known'
  table.parts.create name: 'sequence_name', value_type: 'string', hint: 'if known'

db  = mysql.children.create name: 'Server'
  db.parts.create name: 'database', value_type: 'string', is_required: true, hint: 'database connection identifier', placeholder: 'database name', label: ''
  db.parts.create name: 'host', value_type: 'string', hint: 'localhost or fqdn', placeholder: 'host or empty'
  db.parts.create name: 'port', value_type: 'integer', hint: 'number or empty', placeholder: ''
  db.parts.create name: 'username', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'user'
  db.parts.create name: 'password', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'secret'
 table = db.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', is_required: true, hint: 'table name'
  table.parts.create name: 'primary_key', value_type: 'string', hint: 'if known'
  #table.parts.create name: 'sequence_name', value_type: 'string', hint: 'if known'

db  = oracle.children.create name: 'Server'
  db.parts.create name: 'database', value_type: 'string', is_required: true, hint: 'database connection identifier', placeholder: 'database name', label: ''
  db.parts.create name: 'username', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'user'
  db.parts.create name: 'password', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'secret'
 table = db.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', is_required: true, hint: 'qualified table name', placeholder: 'hr.hr_employees', label: ''
  table.parts.create name: 'primary_key', value_type: 'string', hint: 'if known'
  table.parts.create name: 'sequence_name', value_type: 'string', hint: 'if known'

db  = mssql.children.create name: 'Server'
  #mode: odbc
  #  dsn: project_test
  #  database: test #This must be the real name of the database on the server, not the ODBC DSN! Only required for test.
  #  username: dbuser
  #  password: password
  #  encoding: utf8
  db.parts.create name: 'database', value_type: 'string', hint: 'database name if not ODBC DSN', placeholder: 'test'
  db.parts.create name: 'dsn', value_type: 'string', hint: 'ODBC DSN', placeholder: 'dsn'
  db.parts.create name: 'encoding', value_type: 'string', hint: 'Character encoding', default_value: 'utf8'
  db.parts.create name: 'username', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'dbuser'
  db.parts.create name: 'password', value_type: 'string', is_required: true, hint: 'Get from DB admin', placeholder: 'password'
 table = db.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', is_required: true, hint: 'table name'
  table.parts.create name: 'primary_key', value_type: 'string', hint: 'if known'
  table.parts.create name: 'sequence_name', value_type: 'string', hint: 'if known'


# Files are the other possibilities
puts "File"
file = Category.create(name: 'File', fertile: false)
  file.sources.create(name: 'File', remarks: 'Abstract Class', fertile: false)
  dir = file.children.create(name: 'Path', remarks: 'with wild cards possible', fertile: true)
  dir.parts.create name: 'directory', value_type: 'string', is_required: true, is_in_row: false
  dir.parts.create name: 'file', value_type: 'string', is_required: true, is_in_row: false

# For some reason the before_save is not called when creating
Category.all.each { |c| c.save }
Source.all.each { |source|  source.get_descriptors }
