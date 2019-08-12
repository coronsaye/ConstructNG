class Api::V1::SectorsController < ApplicationController
  before_action :authenticate_request
  before_action :set_sector, only: [:show, :update, :destroy]

  # GET /api/v1/sectors
  def index
    @sectors = Sector.all

    render json: @sectors
  end

  # GET /api/v1/sectors/1
  def show
    render json: @sector
  end

  # POST /api/v1/sectors
  def create
    @sector = Sector.new(sector_params)

    if @sector.save
      render json: @sector
    else
      render json: @sector.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/sectors/1
  def update
    if @sector.update(sector_params)
      render json: @sector
    else
      render json: @sector.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/sectors/1
  def destroy
    @sector.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sector
      @sector = Sector.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sector_params
      params.fetch(:sector, {}).permit(:name, :parent)
    end
end
