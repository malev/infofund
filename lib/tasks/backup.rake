require "pathname"
require 'yaml'

task :backup => :environment do
  yml_file    = Pathname.new(Padrino.root) + "config/mongoid.yml"
  tmp_dir     = Pathname.new(Padrino.root) + "tmp"
  backup_dir  = tmp_dir + 'backup'
  dump_dir    = tmp_dir + 'dump'
  backup_file = "mongo-" + Time.now.strftime("%Y-%m-%d") + ".tar.gz"
  backup_dir  = Pathname.new(Padrino.root) + "../backup"

  mongo_conf  = YAML.load_file(yml_file)['production']['sessions']['default']

  params_hash = {
    h: mongo_conf['hosts'][0],
    d: mongo_conf['database'],
    u: mongo_conf['username'],
    p: mongo_conf['password']
  }

  params_str = params_hash.collect { |k, v| ["-#{k}", v].join(" ")}
  mongodump = ["mongodump", params_str].join(" ")

  exec("#{mongodump} && tar -zcvf #{backup_file} dump && rm -rf ./dump && mv #{backup_file} #{backup_dir}")
end
