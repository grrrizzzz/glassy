require 'glassy/version'
require 'pp'
require 'json'

module Glassy
  class Location

    OPENWEATHERMAP_TOKEN = ENV['OPENWEATHERMAP_TOKEN']
    OPENWEATHERMAP_HOST = 'http://api.openweathermap.org'

    def initialize(latitude, longitude)
      response = `curl -s "#{OPENWEATHERMAP_HOST}/data/2.5/weather?APPID=#{OPENWEATHERMAP_TOKEN}&lat=#{latitude}&lon=#{longitude}"`
      json = JSON.parse(response)
      p json
    end

    def self.where?
      p 'Here!'
    end
  end
end
