class Api::V1::TaxClassesController < ApplicationController
  before_action :authenticate_request
  before_action :set_tax_class, only: [:show, :update, :destroy]

  # GET /api/v1/tax_classes
  def index
    @tax_classes = TaxClass.all

    render json: @tax_classes
  end

  # GET /api/v1/tax_classes/1
  def show
    render json: @tax_class
  end

  # POST /api/v1/tax_classes
  def create
    @tax_class = TaxClass.new(tax_class_params)

    if @tax_class.save
      render json: @tax_class
    else
      render json: @tax_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/tax_classes/1
  def update
    if @tax_class.update(tax_class_params)
      render json: @tax_class
    else
      render json: @tax_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/tax_classes/1
  def destroy
    @tax_class.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_class
      @tax_class = TaxClass.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tax_class_params
      params.fetch(:tax_class, {}).permit(:title,:description)
    end
end
