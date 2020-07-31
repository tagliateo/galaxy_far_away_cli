require_relative "galaxy_far_away_cli/version"
require_relative "galaxy_far_away_cli/api"
require_relative "galaxy_far_away_cli/cli"
require_relative "galaxy_far_away_cli/film"


require 'pry'
require 'httparty'
require 'json'
require 'colorize'




module GalaxyFarAwayCli
  class Error < StandardError; end
  # Your code goes here...
end
