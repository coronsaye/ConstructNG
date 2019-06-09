class Api::V1::StatesController < ApplicationController
  before_action :set_api_v1_state, only: [:show, :update, :destroy]

  # GET /api/v1/states
  def index
    @api_v1_states = Api::V1::State.all

    render json: @api_v1_states
  end

  # GET /api/v1/states/1
  def show
    render json: @api_v1_state
  end

  # POST /api/v1/states
  def create
    @api_v1_state = Api::V1::State.new(api_v1_state_params)

    if @api_v1_state.save
      render json: @api_v1_state, status: :created, location: @api_v1_state
    else
      render json: @api_v1_state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/states/1
  def update
    if @api_v1_state.update(api_v1_state_params)
      render json: @api_v1_state
    else
      render json: @api_v1_state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/states/1
  def destroy
    @api_v1_state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_state
      @api_v1_state = Api::V1::State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_state_params
      params.fetch(:api_v1_state, {})
    end
end
