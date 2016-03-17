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
dbsystem = Category.create(name: 'Database')
  adapter = dbsystem.parts.create name: 'adapter', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: '', placeholder: '', label: ''
oracle = dbsystem.sources.create name: 'Oracle', remarks: 'Abstract Category'
  oracle.descriptors.create( part_id: adapter.id, name: adapter.name, content: 'oracle_enhanced' )
mssql = dbsystem.sources.create name: 'MS SQL', remarks: 'Abstract Category'
  mssql.descriptors.create( part_id: adapter.id, name: adapter.name, content: 'mssql' )
mysql = dbsystem.sources.create name: 'MySQL', remarks: 'Abstract Category'
  mysql.descriptors.create( part_id: adapter.id, name: adapter.name, content: 'mysql2' )

db  = dbsystem.children.create name: 'Server'
  db.parts.create name: 'database', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'database connection identifier', placeholder: 'database name', label: ''
  db.parts.create name: 'host', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'localhost or fqdn', placeholder: 'host or empty', label: ''
  db.parts.create name: 'port', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'number or empty', placeholder: '', label: ''
  db.parts.create name: 'username', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from DB admin', placeholder: 'user', label: ''
  db.parts.create name: 'password', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from DB admin', placeholder: 'secret', label: ''
 table = db.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'qualified table name', placeholder: 'hr.hr_employees', label: ''
  table.parts.create name: 'primary_key', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'if known', placeholder: '', label: ''
  table.parts.create name: 'sequence_name', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'if known', placeholder: '', label: ''


# Files are the other possibilities
file = Category.create(name: 'File')
  file.parts.create name: 'directory', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: true, is_in_row: false, hint: '', placeholder: '', label: ''

# For some reason the before_save is not called when creating
Category.all.each { |c| c.save }
