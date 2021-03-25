# one source of truth, where I load all of my files
  # load all lib files, gems, anything I want to use across my app
  # so don't have to keep requiring it across app

# frozen_string_literal: true

# require_relative: used for any files being extended across app, lives in app
# require: load anything external to app, not built in app, exact path

require_relative "./beer_o_clock_cli/version"
require_relative "./beer_o_clock_cli/api.rb"
require_relative "./beer_o_clock_cli/cli.rb"
require_relative "./beer_o_clock_cli/brewery.rb"

#gem install rest-client - had to do this bc of "cannot load such file -- rest-client (LoadError)"
require 'rest-client'
require 'json'
require 'pry'