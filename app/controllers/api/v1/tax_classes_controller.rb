class Api::V1::TaxClassesController < ApplicationController
  before_action :set_api_v1_tax_class, only: [:show, :update, :destroy]

  # GET /api/v1/tax_classes
  def index
    @api_v1_tax_classes = Api::V1::TaxClass.all

    render json: @api_v1_tax_classes
  end

  # GET /api/v1/tax_classes/1
  def show
    render json: @api_v1_tax_class
  end

  # POST /api/v1/tax_classes
  def create
    @api_v1_tax_class = Api::V1::TaxClass.new(api_v1_tax_class_params)

    if @api_v1_tax_class.save
      render json: @api_v1_tax_class, status: :created, location: @api_v1_tax_class
    else
      render json: @api_v1_tax_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tax_classes/1
  def update
    if @api_v1_tax_class.update(api_v1_tax_class_params)
      render json: @api_v1_tax_class
    else
      render json: @api_v1_tax_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tax_classes/1
  def destroy
    @api_v1_tax_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_tax_class
      @api_v1_tax_class = Api::V1::TaxClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_tax_class_params
      params.fetch(:api_v1_tax_class, {})
    end
end
