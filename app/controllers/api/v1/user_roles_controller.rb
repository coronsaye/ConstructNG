class Api::V1::UserRolesController < ApplicationController
  before_action :set_api_v1_user_role, only: [:show, :update, :destroy]

  # GET /api/v1/user_roles
  def index
    @api_v1_user_roles = Api::V1::UserRole.all

    render json: @api_v1_user_roles
  end

  # GET /api/v1/user_roles/1
  def show
    render json: @api_v1_user_role
  end

  # POST /api/v1/user_roles
  def create
    @api_v1_user_role = Api::V1::UserRole.new(api_v1_user_role_params)

    if @api_v1_user_role.save
      render json: @api_v1_user_role, status: :created, location: @api_v1_user_role
    else
      render json: @api_v1_user_role.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/user_roles/1
  def update
    if @api_v1_user_role.update(api_v1_user_role_params)
      render json: @api_v1_user_role
    else
      render json: @api_v1_user_role.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/user_roles/1
  def destroy
    @api_v1_user_role.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_user_role
      @api_v1_user_role = Api::V1::UserRole.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_user_role_params
      params.fetch(:api_v1_user_role, {})
    end
end
