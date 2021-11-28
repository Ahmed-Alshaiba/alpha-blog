class CategoriesController < ApplicationController
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "The category #{@category.name} was added successfuly"
      redirect_to @category
    else
      render 'new'
    end
  end

  def index

  end

  def show

  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
  
end