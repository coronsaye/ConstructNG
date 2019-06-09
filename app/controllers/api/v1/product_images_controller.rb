class Api::V1::ProductImagesController < ApplicationController
  before_action :set_api_v1_product_image, only: [:show, :update, :destroy]

  # GET /api/v1/product_images
  def index
    @api_v1_product_images = Api::V1::ProductImage.all

    render json: @api_v1_product_images
  end

  # GET /api/v1/product_images/1
  def show
    render json: @api_v1_product_image
  end

  # POST /api/v1/product_images
  def create
    @api_v1_product_image = Api::V1::ProductImage.new(api_v1_product_image_params)

    if @api_v1_product_image.save
      render json: @api_v1_product_image, status: :created, location: @api_v1_product_image
    else
      render json: @api_v1_product_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/product_images/1
  def update
    if @api_v1_product_image.update(api_v1_product_image_params)
      render json: @api_v1_product_image
    else
      render json: @api_v1_product_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/product_images/1
  def destroy
    @api_v1_product_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_product_image
      @api_v1_product_image = Api::V1::ProductImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def api_v1_product_image_params
      params.fetch(:api_v1_product_image, {})
    end
end
