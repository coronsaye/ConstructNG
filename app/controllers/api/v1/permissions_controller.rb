class Api::V1::PermissionsController < ApplicationController
  before_action :authenticate_request
  before_action :set_permission, only: [:show, :update, :destroy]

  # GET /api/v1/permissions
  def index
    @permissions = Permission.all

    render json: @permissions
  end

  # GET /api/v1/permissions/1
  def show
    render json: @permission
  end

  # POST /api/v1/permissions
  def create
    @permission = Permission.new(permission_params)

    if @permission.save
      render json: @permission
    
    else
      render json: @permission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/permissions/1
  def update
    if @permission.update(permission_params)
      render json: @permission
    else
      render json: @permission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/permissions/1
  def destroy
    @permission.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_permission
      @permission = Permission.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def permission_params
      params.fetch(:permission, {}).permit(:name)
    end
end
