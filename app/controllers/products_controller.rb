class ProductsController < ApplicationController
  def index
    @products = Product.paginate(page: params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product added!"
      redirect_to products_url
    else
      flash.now[:danger] = "Error! Product not created!"
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated"
      redirect_to @product
    else
      flash.now[:danger] = "Error! Product not updated!"
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit(:name, :category_id)
  end

end
