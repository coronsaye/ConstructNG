class Api::V1::RolePermissionsController < ApplicationController
  before_action :set_api_v1_role_permission, only: [:show, :update, :destroy]

  # GET /api/v1/role_permissions
  def index
    @api_v1_role_permissions = Api::V1::RolePermission.all

    render json: @api_v1_role_permissions
  end

  # GET /api/v1/role_permissions/1
  def show
    render json: @api_v1_role_permission
  end

  # POST /api/v1/role_permissions
  def create
    @api_v1_role_permission = Api::V1::RolePermission.new(api_v1_role_permission_params)

    if @api_v1_role_permission.save
      render json: @api_v1_role_permission, status: :created, location: @api_v1_role_permission
    else
      render json: @api_v1_role_permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/role_permissions/1
  def update
    if @api_v1_role_permission.update(api_v1_role_permission_params)
      render json: @api_v1_role_permission
    else
      render json: @api_v1_role_permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/role_permissions/1
  def destroy
    @api_v1_role_permission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_role_permission
      @api_v1_role_permission = Api::V1::RolePermission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_role_permission_params
      params.fetch(:api_v1_role_permission, {})
    end
end
