$:.unshift File.expand_path('src')

require 'interfaces/cli'
SoccerCli.start(ARGV)
