# require 'bundler'
# Bundler.require

require_relative "./beer_o_clock_cli/api.rb"
require_relative "./beer_o_clock_cli/cli.rb"
require_relative "./beer_o_clock_cli/brewery.rb"

require 'rest-client'
require 'json'
require 'pry'
require 'rainbow'
require 'tty-prompt'
#require_rel './lib'