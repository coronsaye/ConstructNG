class Api::V1::SuppliersController < ApplicationController
  before_action :set_api_v1_supplier, only: [:show, :update, :destroy]

  # GET /api/v1/suppliers
  def index
    @api_v1_suppliers = Api::V1::Supplier.all

    render json: @api_v1_suppliers
  end

  # GET /api/v1/suppliers/1
  def show
    render json: @api_v1_supplier
  end

  # POST /api/v1/suppliers
  def create
    @api_v1_supplier = Api::V1::Supplier.new(api_v1_supplier_params)

    if @api_v1_supplier.save
      render json: @api_v1_supplier, status: :created, location: @api_v1_supplier
    else
      render json: @api_v1_supplier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/suppliers/1
  def update
    if @api_v1_supplier.update(api_v1_supplier_params)
      render json: @api_v1_supplier
    else
      render json: @api_v1_supplier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/suppliers/1
  def destroy
    @api_v1_supplier.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_supplier
      @api_v1_supplier = Api::V1::Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_supplier_params
      params.fetch(:api_v1_supplier, {})
    end
end
