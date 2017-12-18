require_relative 'services/single_weather_id_service'
require_relative 'services/single_weather_name_service'


class SingleWeatherio

  def single_weather_id_location
    SingleWeatherService.new
  end

  def single_weather_name_location
    SingleWeatherName.new
  end
end
