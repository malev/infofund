require 'yaml'

Mongoid.load!("config/mongoid.yml", Padrino.env)

if Padrino.env == :development
  Mongoid.logger.level = Logger::INFO
else
  Mongoid.logger.level = Logger::ERROR
end

Mongoid.logger = Padrino.logger