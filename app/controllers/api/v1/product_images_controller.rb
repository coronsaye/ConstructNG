class Api::V1::ProductImagesController < ApplicationController
  before_action :set_product_image, only: [:show, :update, :destroy]

  # GET /api/v1/product_images
  def index
    @product_images = ProductImage.all

    render json: @product_images
  end

  # GET /api/v1/product_images/1
  def show
    render json: @product_image
  end

  # POST /api/v1/product_images
  def create
    @product_image = ProductImage.new(product_image_params)

    if @product_image.save
      render json: @product_image, status: :created, location: @product_image
    else
      render json: @product_image.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/product_images/1
  def update
    if @product_image.update(product_image_params)
      render json: @product_image
    else
      render json: @product_image.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/product_images/1
  def destroy
    @product_image.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_image
      @product_image = ProductImage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_image_params
      params.fetch(:product_image, {}).permit(:image_base64, :image_url, :html_content, :sort_order)
    end
end
