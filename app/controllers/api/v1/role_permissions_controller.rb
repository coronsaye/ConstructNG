class Api::V1::RolePermissionsController < ApplicationController
  before_action :set_role_permission, only: [:show, :update, :destroy]

  # GET /api/v1/role_permissions
  def index
    @role_permissions = RolePermission.all

    render json: @role_permissions
  end

  # GET /api/v1/role_permissions/1
  def show
    render json: @role_permission
  end

  # POST /api/v1/role_permissions
  def create
    @role_permission = RolePermission.new(role_permission_params)

    if @role_permission.save
      render json: @role_permission
    else
      render json: @role_permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/role_permissions/1
  def update
    if @role_permission.update(role_permission_params)
      render json: @role_permissio
    else
      render json: @role_permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/role_permissions/1
  def destroy
    @role_permission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_permission
      @role_permission = RolePermission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def role_permission_params
      params.fetch(:role_permission, {}).permit(:role_id, :permission_id)
    end
end
