class Api::V1::TaxRatesController < ApplicationController
  before_action :set_api_v1_tax_rate, only: [:show, :update, :destroy]

  # GET /api/v1/tax_rates
  def index
    @api_v1_tax_rates = Api::V1::TaxRate.all

    render json: @api_v1_tax_rates
  end

  # GET /api/v1/tax_rates/1
  def show
    render json: @api_v1_tax_rate
  end

  # POST /api/v1/tax_rates
  def create
    @api_v1_tax_rate = Api::V1::TaxRate.new(api_v1_tax_rate_params)

    if @api_v1_tax_rate.save
      render json: @api_v1_tax_rate, status: :created, location: @api_v1_tax_rate
    else
      render json: @api_v1_tax_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tax_rates/1
  def update
    if @api_v1_tax_rate.update(api_v1_tax_rate_params)
      render json: @api_v1_tax_rate
    else
      render json: @api_v1_tax_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tax_rates/1
  def destroy
    @api_v1_tax_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_tax_rate
      @api_v1_tax_rate = Api::V1::TaxRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_tax_rate_params
      params.fetch(:api_v1_tax_rate, {})
    end
end
