class Api::V1::ManufacturersController < ApplicationController
  before_action :set_manufacturer, only: [:show, :update, :destroy]

  # GET /api/v1/manufacturers
  def index
    @manufacturers = Manufacturer.all

    render json: @manufacturers
  end

  # GET /api/v1/manufacturers/1
  def show
    render json: @manufacturer
  end

  # POST /api/v1/manufacturers
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    if @manufacturer.save
      render json: @manufacturer
    else
      render json: @manufacturer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/manufacturers/1
  def update
    if @manufacturer.update(manufacturer_params)
      render json: @manufacturer
    else
      render json: @manufacturer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/manufacturers/1
  def destroy
    @manufacturer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def manufacturer_params
      params.require(:manufacturer)
    end
end
