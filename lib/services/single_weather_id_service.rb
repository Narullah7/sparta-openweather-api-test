require 'json'
require 'httparty'

class SingleWeatherService
  include HTTParty

  attr_accessor :single_weather_data, :api_key

  base_uri 'http://api.openweathermap.org/data/2.5/forecast?'

  def initialize
    @api_key = "&APPID=e5cb8e57460b0035b50a9b5fa1c89454"
  end

  def get_single_weather_id_location(zip)
    @single_weather_data = JSON::parse(self.class.get("id=#{zip}#{@api_key}").body)
  end

  def get_cod
    @single_weather_data['cod'].to_i
  end

  def status_attributes
    @single_weather_data['list']
  end

  def get_message
    @single_weather_data['message']
  end

  def get__latitude
    @single_weather_data['city']['coord']['lat']
  end

  def get_longitude
    @single_weather_data['city']['coord']['lon']
  end


end

# x = SingleWeatherService.new
# puts x.get_single_weather_location("2638976")
