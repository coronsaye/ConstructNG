class Api::V1::TaxRatesController < ApplicationController
  before_action :authenticate_request
  before_action :set_tax_rate, only: [:show, :update, :destroy]

  # GET /api/v1/tax_rates
  def index
    @tax_rates = TaxRate.all

    render json: @tax_rates
  end

  # GET /api/v1/tax_rates/1
  def show
    render json: @tax_rate
  end

  # POST /api/v1/tax_rates
  def create
    @tax_rate = TaxRate.new(tax_rate_params)

    if @tax_rate.save
      render json: @tax_rate
    else
      render json: @tax_rate.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tax_rates/1
  def update
    if @atax_rate.update(tax_rate_params)
      render json: @tax_rate
    else
      render json: @tax_rate.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tax_rates/1
  def destroy
    @tax_rate.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_rate
      @tax_rate = TaxRate.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_rate_params
      params.fetch(:tax_rate, {}).permit(:rate_code , :priority)
    end
end
