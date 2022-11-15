require 'rails_helper'

RSpec.describe 'flights index page' do 
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
    @passenger4 = @flight2.passengers.create!(name: 'sergio', age: 24)
    @passenger5 = @flight3.passengers.create!(name: 'naomi', age: 25)
    @passenger6 = @flight3.passengers.create!(name: 'shawn', age: 26)

    visit "/flights"
  end

  describe 'when I visit flights index page' do 
    it 'I see a list of all flight numbers' do 
      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@flight3.number)
      expect(page).to have_content(@flight4.number)
    end

    it 'see the airline name of that flight' do 
      expect(page).to have_content(@airline1.name)
      expect(page).to have_content(@airline2.name)
    end

    it 'and under each flight number, I see the names of all passengers' do 
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@passenger3.name)
      expect(page).to have_content(@passenger4.name)
      expect(page).to have_content(@passenger5.name)
      expect(page).to have_content(@passenger6.name)
    end

    it 'next to passenger name, I see a link to remove them from the flight' do 
      expect(page).to have_link("Remove #{@passenger1.name}")
    end

    it 'when I click that link, am taken to flights index page, no longer see that pass name on the flight' do 
      click_link "Remove #{@passenger1.name}"
      expect(current_path).to eq("/flights")
      expect(page).to_not have_content(@passenger1.name)
    end
  end
end