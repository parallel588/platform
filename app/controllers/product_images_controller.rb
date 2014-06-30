class ProductImagesController < ApplicationController
  inherit_resources
  actions :edit, :update, :destroy
  belongs_to :product

  protected

  # def permitted_params
  #   params.permit(product_iamge: [])
  # end

end
