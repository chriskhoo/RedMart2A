class CategoriesController < ApplicationController
  # def index
  # end
  #
  # def edit
  # end
  #
  # def show
  # end
  #
  # def new
  # end
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = @category.products
    #How do I paginate this? .paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category added!"
      redirect_to categories_url
    else
      flash.now[:danger] = "Error! Category not created!"
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      flash.now[:danger] = "Error! Category not updated!"
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private
  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
