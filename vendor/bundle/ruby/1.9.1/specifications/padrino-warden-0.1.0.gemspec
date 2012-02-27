# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "padrino-warden"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dotan Nahum"]
  s.date = "2010-07-31"
  s.description = "basic helpers and authentication methods for using warden with padrino also providing some hooks into Rack::Flash"
  s.email = "dotan@paracode.com"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/jondot/padrino-warden"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "authentication system for using warden with Padrino, adopted from sinatra_warden"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<warden>, [">= 0.10.3"])
    else
      s.add_dependency(%q<warden>, [">= 0.10.3"])
    end
  else
    s.add_dependency(%q<warden>, [">= 0.10.3"])
  end
end
