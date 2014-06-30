class ProductImagesController < ApplicationController
  inherit_resources
  actions :edit, :update, :show
  belongs_to :product

  def update
    resource.crop!(params[:crop_x], params[:crop_y],
                   params[:crop_w], params[:crop_h])
    redirect_to  product_photo_path(parent, resource)
  end

  protected

  # def permitted_params
  #   params.permit(product_iamge: [])
  # end

end
