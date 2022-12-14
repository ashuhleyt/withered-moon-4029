require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'relationships' do
    it {should have_many :flights}
    it { should have_many(:flight_passengers).through(:flights) }
    it { should have_many(:passengers).through(:flight_passengers) }
  end 
    before :each do 
    @airline1 = Airline.create!(name: 'united')
    @airline2 = Airline.create!(name: 'delta')

    @flight1 = @airline1.flights.create!(number: "1", date: "1/1/22", departure_city: "denver", arrival_city: "seattle")
    @flight2 = @airline1.flights.create!(number: "2", date: "1/1/22", departure_city: "tampa", arrival_city: "nashville")
    @flight3 = @airline2.flights.create!(number: "3", date: "1/1/22", departure_city: "portland", arrival_city: "boston")
    @flight4 = @airline2.flights.create!(number: "4", date: "1/1/22", departure_city: "vancouver", arrival_city: "anchorage")

    @passenger1 = @flight1.passengers.create!(name: 'ashley', age: 21)
    @passenger2 = @flight1.passengers.create!(name: 'abdul', age: 22)
    @passenger3 = @flight2.passengers.create!(name: 'michael', age: 23)
    @passenger4 = @flight2.passengers.create!(name: 'sergio', age: 17)
    @passenger5 = @flight3.passengers.create!(name: 'naomi', age: 25)
    @passenger6 = @flight3.passengers.create!(name: 'shawn', age: 26)
  end

  describe '#adult_passengers' do 
    it 'returns a list of passengers for specific airline who is 18 or older' do 
      expect(@airline1.adult_passengers).to eq([@passenger1, @passenger2, @passenger3])
    end
  end
end
