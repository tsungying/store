class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_product, only: [:show, :edit, :update]

  layout 'admin'

  def index
    @products = Product.all.page(params[:page])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice:'新增商品成功'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product]
    else
      render 'edit'
    end
  end

  def authenticate_admin
    redirect_to root_url, alert: 'Not authorized.' unless current_user.admin
  end

  private

  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :original_price, :discount_price, :image)
  end
end
