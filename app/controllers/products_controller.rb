class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_product_ownership!, only: [:edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = User.find(params[:user_id]).products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
      if @product.save
        redirect_to product_url(:id => @product.id), notice: 'Product was successfully created.'
      else
        render action: 'new'
      end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render action: 'edit' 
      end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
      redirect_to user_products_url(current_user)
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :type, :subtype, :country, :volume, :size, :quality, :bidding, :ending_at, :delivery_at, :shipping_information, :packaging_information, :pallets, :starting_at, :user_id, :product_category_id)
    end
    
    def authenticate_product_ownership!
      @product.user_id == current_user.id
    end
end
