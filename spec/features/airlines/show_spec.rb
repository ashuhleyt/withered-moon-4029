require 'rails_helper'

RSpec.describe 'airlines show page' do 
  before :each do 
    @airline1 = Airline.create!(name: 'united')
    @airline2 = Airline.create!(name: 'delta')

    @flight1 = @airline1.flights.create!(number: "1", date: "1/1/22", departure_city: "denver", arrival_city: "seattle")
    @flight2 = @airline1.flights.create!(number: "2", date: "1/1/22", departure_city: "tampa", arrival_city: "nashville")
    @flight3 = @airline2.flights.create!(number: "3", date: "1/1/22", departure_city: "portland", arrival_city: "boston")
    @flight4 = @airline2.flights.create!(number: "4", date: "1/1/22", departure_city: "vancouver", arrival_city: "anchorage")

    @passenger1 = @flight1.passengers.create!(name: 'ashley', age: 21)
    @passenger2 = @flight1.passengers.create!(name: 'abdul', age: 22)
    @passenger3 = @flight2.passengers.create!(name: 'michael', age: 17)
    @passenger4 = @flight2.passengers.create!(name: 'sergio', age: 24)
    @passenger5 = @flight3.passengers.create!(name: 'naomi', age: 25)
    @passenger6 = @flight3.passengers.create!(name: 'shawn', age: 26)

    visit "/airlines/#{@airline1.id}"
  end

  describe 'when I visit an airlines show page' do 
    it 'I see a list of passengers that have flights on that airline' do
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to_not have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
    end 
  end
end