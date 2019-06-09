class Api::V1::SectorsController < ApplicationController
  before_action :set_api_v1_sector, only: [:show, :update, :destroy]

  # GET /api/v1/sectors
  def index
    @api_v1_sectors = Api::V1::Sector.all

    render json: @api_v1_sectors
  end

  # GET /api/v1/sectors/1
  def show
    render json: @api_v1_sector
  end

  # POST /api/v1/sectors
  def create
    @api_v1_sector = Api::V1::Sector.new(api_v1_sector_params)

    if @api_v1_sector.save
      render json: @api_v1_sector, status: :created, location: @api_v1_sector
    else
      render json: @api_v1_sector.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/sectors/1
  def update
    if @api_v1_sector.update(api_v1_sector_params)
      render json: @api_v1_sector
    else
      render json: @api_v1_sector.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/sectors/1
  def destroy
    @api_v1_sector.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_sector
      @api_v1_sector = Api::V1::Sector.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_sector_params
      params.fetch(:api_v1_sector, {})
    end
end
