class Api::V1::PermissionsController < ApplicationController
  before_action :set_api_v1_permission, only: [:show, :update, :destroy]

  # GET /api/v1/permissions
  def index
    @api_v1_permissions = Api::V1::Permission.all

    render json: @api_v1_permissions
  end

  # GET /api/v1/permissions/1
  def show
    render json: @api_v1_permission
  end

  # POST /api/v1/permissions
  def create
    @api_v1_permission = Api::V1::Permission.new(api_v1_permission_params)

    if @api_v1_permission.save
      render json: @api_v1_permission, status: :created, location: @api_v1_permission
    else
      render json: @api_v1_permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/permissions/1
  def update
    if @api_v1_permission.update(api_v1_permission_params)
      render json: @api_v1_permission
    else
      render json: @api_v1_permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/permissions/1
  def destroy
    @api_v1_permission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_permission
      @api_v1_permission = Api::V1::Permission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_permission_params
      params.fetch(:api_v1_permission, {}).permit(:name)
    end
end
