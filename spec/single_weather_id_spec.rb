require 'spec_helper'

describe 'requesting weather on a single weather by id' do
  before(:all) do
    @weatherio = SingleWeatherio.new.single_weather_id_location
    @weatherio.get_single_weather_id_location(2638976)
  end


    it 'The format of the data should be presented in hash form' do
      expect(@weatherio.single_weather_data).to be_kind_of(Hash)
    end

    it 'status code should be 200' do
      expect(@weatherio.get_cod.to_i).to eq(200)
    end

    it 'List should have 39 attributes inside it'do
      expect(@weatherio.status_attributes.count
      ).to be_between(35,40)
    end

    it 'the message attribute should be in the form FLOAT' do
      expect(@weatherio.get_message).to be_kind_of(Float)
    end

    it 'the message attribute should be a number between 0 and 1' do
      expect(@weatherio.get_message).to be_between(0,1).inclusive
    end

    it "longitude should be a FLOAT" do
      expect(@weatherio.get_longitude).to be_kind_of(Float)
    end

    it "latitude should be a FLOAT" do
      expect(@weatherio.get__latitude).to be_kind_of(Float)
    end








end
