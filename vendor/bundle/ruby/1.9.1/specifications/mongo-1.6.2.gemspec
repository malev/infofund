# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mongo"
  s.version = "1.6.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jim Menard", "Mike Dirolf", "Kyle Banker", "Tyler Brock"]
  s.date = "2012-04-05"
  s.description = "A Ruby driver for MongoDB. For more information about Mongo, see http://www.mongodb.org."
  s.email = "mongodb-dev@googlegroups.com"
  s.executables = ["mongo_console"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["bin/mongo_console", "README.md"]
  s.homepage = "http://www.mongodb.org"
  s.rdoc_options = ["--main", "README.md", "--inline-source"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Ruby driver for MongoDB"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<bson>, ["~> 1.6.2"])
    else
      s.add_dependency(%q<bson>, ["~> 1.6.2"])
    end
  else
    s.add_dependency(%q<bson>, ["~> 1.6.2"])
  end
end
