require_relative "galaxy_far_away_cli/version"
require_relative "galaxy_far_away_cli/services/api"
require_relative "galaxy_far_away_cli/cli"
require_relative "galaxy_far_away_cli/models/film"
require_relative "galaxy_far_away_cli/models/species"



require 'pry'
require 'httparty'
require 'json'
require 'colorize'

# require 'rest-client'




module GalaxyFarAwayCli
  class Error < StandardError; end
  # Your code goes here...
end
