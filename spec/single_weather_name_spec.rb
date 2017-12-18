require 'spec_helper'

describe 'requesting weather on a single weather by name ' do
  before(:all) do
    @singleweathername = SingleWeatherio.new.single_weather_name_location
    @singleweathername.get_single_weather_name_location("Nauru")
  end

  it 'The format of the data should be presented in hash form' do
    expect(@singleweathername.single_weather_name).to be_kind_of(Hash)
  end

  it 'status code should be 200' do
    expect(@singleweathername.get_cod.to_i).to eq(200)
  end

  it 'List should have betwee 38 and 39 attributes inside it'do
    expect(@singleweathername.status_attributes.count
    ).to be_between(38,39)
  end

  it 'the message attribute should be in the form FLOAT' do
    expect(@singleweathername.get_message).to be_kind_of(Float)
  end

  it 'the message attribute should be a number between 0 and 1' do
    expect(@singleweathername.get_message).to be_between(0,1).inclusive
  end

  it "longitude should be a FLOAT" do
    expect(@singleweathername.get_longitude).to be_kind_of(Float)
  end

  it "latitude should be a FLOAT" do
    expect(@singleweathername.get__latitude).to be_kind_of(Float)
  end




end
