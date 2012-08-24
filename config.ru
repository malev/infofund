#!/usr/bin/env rackup
# encoding: utf-8
require './thread-dumper'

use Rack::Auth::Basic, "Restricted Area" do |username, password|
     [username, password] == ['admin', 'genius']
end

require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application

