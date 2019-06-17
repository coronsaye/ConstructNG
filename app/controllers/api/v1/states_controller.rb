class Api::V1::StatesController < ApplicationController
  before_action :set_state, only: [:show, :update, :destroy]

  # GET /api/v1/states
  def index
    @states = State.all

    render json: @states
  end

  # GET /api/v1/states/1
  def show
    render json: @state
  end

  # POST /api/v1/states
  def create
    @state = State.new(state_params)

    if @state.save
      render json: @state
    else
      render json: @api_v1_state.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/states/1
  def update
    if @state.update(state_params)
      render json: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/states/1
  def destroy
    @state.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def state_params
      params.fetch(:state, {}).permit(:name)
    end
end
