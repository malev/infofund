#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.
#
#
use Rack::Auth::Basic, "Restricted Area" do |username, password|
     [username, password] == ['admin', 'genius']
end


require File.expand_path("../config/boot.rb", __FILE__)

run Padrino.application
