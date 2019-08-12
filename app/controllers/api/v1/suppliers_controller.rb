class Api::V1::SuppliersController < ApplicationController
  before_action :authenticate_request
  before_action :set_supplier, only: [:show, :update, :destroy]

  # GET /api/v1/suppliers
  def index
    @suppliers = Supplier.all

    render json: @suppliers
  end

  # GET /api/v1/suppliers/1
  def show
    render json: @supplier
  end

  # POST /api/v1/suppliers
  def create
    @supplier = Supplier.new(supplier_params)

    if @supplier.save
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/suppliers/1
  def update
    if @supplier.update(supplier_params)
      render json: @supplier
    else
      render json: @supplier.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/suppliers/1
  def destroy
    @supplier.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def supplier_params
      params.fetch(:supplier, {})
    end
end
