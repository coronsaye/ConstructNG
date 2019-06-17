class Api::V1::OccupationsController < ApplicationController
  before_action :set_occupation, only: [:show, :update, :destroy]

  # GET /api/v1/occupations
  def index
    @occupations = Occupation.all

    render json: @occupations
  end

  # GET /api/v1/occupations/1
  def show
    render json: @occupation
  end

  # POST /api/v1/occupations
  def create
    @occupation = Api::V1::Occupation.new(occupation_params)

    if @occupation.save
      render json: @occupation, status: :created, location: @occupation
    else
      render json: @occupation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/occupations/1
  def update
    if @occupation.update(occupation_params)
      render json: @occupation
    else
      render json: @occupation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/occupations/1
  def destroy
    @occupation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_occupation
      @occupation = Occupation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def occupation_params
      params.require(:occupation).permit(:name)
    end
end
