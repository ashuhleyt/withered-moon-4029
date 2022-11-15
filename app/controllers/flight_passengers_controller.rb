class FlightPassengersController < ApplicationController
  def destroy 
    flight = Flight.find(params[:flight_id]) #params returned specific flight id here
    passenger = Passenger.find(params[:id]) #pry-params only called for id on this one 
    # require 'pry'; binding.pry
    flight_pass = FlightPassenger.find_by(flight_id: flight.id, passenger_id: passenger.id)
    FlightPassenger.destroy(flight_pass.id)
    #calling specifics where these id's line up on joins table, destroying SPECIFIC flight passenger. If you see this
    #can you confirm that? That's how I am understanding it :) 
    
    redirect_to "/flights"
  end
end