require 'pry'

Dir["../lib/**/*.rb"].each { |path| require_relative path }

Pry.start