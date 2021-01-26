class Api::V1::SurvivorsController < ApplicationController
  def index
    @survivors = Survivor.all
    render json: @survivors, status: 200
  end
end

