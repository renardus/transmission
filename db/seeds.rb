# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

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
db = Category.create(name: 'Database')
oracle = db.children.create name: 'Oracle'
  oracle.parts.create name: 'adapter', value_type: 'string', default_value: 'oracle_enhanced', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: true, is_in_row: false, hint: '', placeholder: '', label: ''
  oracle.parts.create name: 'database', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'database or Oracle specific format or TNS connection', placeholder: '//localhost:1521/xe', label: ''
  oracle.parts.create name: 'username', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from Oracle admin', placeholder: 'user', label: ''
  oracle.parts.create name: 'password', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from Oracle admin', placeholder: 'secret', label: ''
 table = oracle.children.create name: 'Table'
  table.parts.create name: 'table_name', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'qualified table name', placeholder: 'hr.hr_employees', label: ''
  table.parts.create name: 'primary_key', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'if known', placeholder: '', label: ''
  table.parts.create name: 'sequence_name', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: false, is_fixed: false, is_in_row: false, hint: 'if known', placeholder: '', label: ''

mssql  = db.children.create name: 'MS SQL'
  mssql.parts.create name: 'adapter', value_type: 'string', default_value: 'mssql', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: true, is_in_row: false, hint: '', placeholder: '', label: ''

mysql  = db.children.create name: 'MySQL'
  mysql.parts.create name: 'adapter', value_type: 'string', default_value: 'mysql2', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: true, is_in_row: false, hint: '', placeholder: '', label: ''
  mysql.parts.create name: 'database', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'database name', placeholder: 'users', label: ''
  mysql.parts.create name: 'username', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from MySQL admin', placeholder: 'user', label: ''
  mysql.parts.create name: 'password', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: false, is_in_row: false, hint: 'Get from MySQL admin', placeholder: 'secret', label: ''

# Files are the other possibilities
file = Category.create(name: 'File')
  file.parts.create name: 'directory', value_type: 'string', default_value: '', possible_values:'', upper_boundary: '', lower_boundary: '', is_required: true, is_fixed: true, is_in_row: false, hint: '', placeholder: '', label: ''
