class SportsController < ApplicationController
  def index
    sports = Sport.all
    render json: SportSerializer.new(sports)
  end
end
