require 'json'
require 'httparty'

class SingleWeatherName
  include HTTParty

  attr_accessor :single_weather_name, :api_key

  base_uri 'http://api.openweathermap.org/data/2.5/forecast?'

  def initialize
    @api_key = "&APPID=e5cb8e57460b0035b50a9b5fa1c89454"
  end

  def get_single_weather_name_location(name)
    @single_weather_name = JSON::parse(self.class.get("q=#{name}#{api_key}").body)
  end

  def get_cod
    @single_weather_name["cod"]
  end

  def status_attributes
    @single_weather_name['list']
  end

  def get_message
    @single_weather_name['message']
  end

  def get__latitude
    @single_weather_name['city']['coord']['lat']
  end

  def get_longitude
    @single_weather_name['city']['coord']['lon']
  end


end


x = SingleWeatherName.new
puts x.get_single_weather_name_location("London")['city']['coord']
