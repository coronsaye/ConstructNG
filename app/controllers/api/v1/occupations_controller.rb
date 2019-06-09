class Api::V1::OccupationsController < ApplicationController
  before_action :set_api_v1_occupation, only: [:show, :update, :destroy]

  # GET /api/v1/occupations
  def index
    @api_v1_occupations = Api::V1::Occupation.all

    render json: @api_v1_occupations
  end

  # GET /api/v1/occupations/1
  def show
    render json: @api_v1_occupation
  end

  # POST /api/v1/occupations
  def create
    @api_v1_occupation = Api::V1::Occupation.new(api_v1_occupation_params)

    if @api_v1_occupation.save
      render json: @api_v1_occupation, status: :created, location: @api_v1_occupation
    else
      render json: @api_v1_occupation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/occupations/1
  def update
    if @api_v1_occupation.update(api_v1_occupation_params)
      render json: @api_v1_occupation
    else
      render json: @api_v1_occupation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/occupations/1
  def destroy
    @api_v1_occupation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_occupation
      @api_v1_occupation = Api::V1::Occupation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_occupation_params
      params.fetch(:api_v1_occupation, {})
    end
end
