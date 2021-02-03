class Api::V1::SurvivorsController < ApplicationController
  def index
    @survivors = Survivor.all
    render json: @survivors, status: 200
  end

  def create
    survivor = Survivor.new(
      name: survivor_params[:name],
      age: survivor_params[:age],
      gender: survivor_params[:gender]
    )

    if survivor.save
      render json: survivor, status: 200
    else
      render json: { error: 'Error create survivor' }
    end
  end

  private
    def survivor_params
      params.permit([
        :name,
        :age,
        :gender
      ])
    end
end
