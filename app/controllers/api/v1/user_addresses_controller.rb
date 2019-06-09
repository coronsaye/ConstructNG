class Api::V1::UserAddressesController < ApplicationController
  before_action :set_api_v1_user_address, only: [:show, :update, :destroy]

  # GET /api/v1/user_addresses
  def index
    @api_v1_user_addresses = Api::V1::UserAddsuppress.all

    render json: @api_v1_user_addresses
  end

  # GET /api/v1/user_addresses/1
  def show
    render json: @api_v1_user_address
  end

  # POST /api/v1/user_addresses
  def create
    @api_v1_user_address = Api::V1::UserAddress.new(api_v1_user_address_params)

    if @api_v1_user_address.save
      render json: @api_v1_user_address, status: :created, location: @api_v1_user_address
    else
      render json: @api_v1_user_address.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/user_addresses/1
  def update
    if @api_v1_user_address.update(api_v1_user_address_params)
      render json: @api_v1_user_address
    else
      render json: @api_v1_user_address.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/user_addresses/1
  def destroy
    @api_v1_user_address.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user_address
      @api_v1_user_address = Api::V1::UserAddress.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_user_address_params
      params.fetch(:api_v1_user_address, {})
    end
end
