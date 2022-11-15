class Airline < ApplicationRecord
  has_many :flights
  has_many :flight_passengers, through: :flights
  has_many :passengers, through: :flight_passengers #building out relationships to make model method more digestible. 

  def adult_passengers
    self.passengers.where('age >= 18').distinct
  end
end
