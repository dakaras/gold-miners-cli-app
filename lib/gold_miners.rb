# this is the environment file
# The convention is to have one Ruby file with the same name as your gem,
# since that gets loaded when require 'gold_miners' is run.
# the gem’s root file is in charge of loading code for the gem.
# The other files for a gem are usually placed in a directory of the same name of the gem inside of lib.
require_relative './gold_miners/version'
require_relative './gold_miners/scraper'
require_relative './gold_miners/cli'
