class Api::V1::ManufacturersController < ApplicationController
  before_action :set_api_v1_manufacturer, only: [:show, :update, :destroy]

  # GET /api/v1/manufacturers
  def index
    @api_v1_manufacturers = Api::V1::Manufacturer.all

    render json: @api_v1_manufacturers
  end

  # GET /api/v1/manufacturers/1
  def show
    render json: @api_v1_manufacturer
  end

  # POST /api/v1/manufacturers
  def create
    @api_v1_manufacturer = Api::V1::Manufacturer.new(api_v1_manufacturer_params)

    if @api_v1_manufacturer.save
      render json: @api_v1_manufacturer, status: :created, location: @api_v1_manufacturer
    else
      render json: @api_v1_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/manufacturers/1
  def update
    if @api_v1_manufacturer.update(api_v1_manufacturer_params)
      render json: @api_v1_manufacturer
    else
      render json: @api_v1_manufacturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/manufacturers/1
  def destroy
    @api_v1_manufacturer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_manufacturer
      @api_v1_manufacturer = Api::V1::Manufacturer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_manufacturer_params
      params.require(:api_v1_manufacturer)
    end
end
