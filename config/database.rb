require 'yaml'

config = YAML.load_file("config/mongoid.yml")

# Connection.new takes host, port
host = ""
port = ""  # Mongo::Connection::DEFAULT_PORT
database_name = ""
username = ""
password = ""

case Padrino.env
  when :development
    host =          config['development']['host']
    port =          config['development']['port']
    database_name = config['development']['database']
    username =      config['development']['username']
    password =      config['development']['password']
  when :production
    host =          config['production']['host']
    port =          config['production']['port']
    database_name = config['production']['database']
    username =      config['production']['username']
    password =      config['production']['password']
  when :test
    host =          config['test']['host']
    port =          config['test']['port']
    database_name = config['test']['database']
    username =      config['test']['username']
    password =      config['test']['password']
end

Mongoid.database = Mongo::Connection.new(host, port).db(database_name)
if username && password
  auth = Mongoid.database.authenticate(username, password)
end
