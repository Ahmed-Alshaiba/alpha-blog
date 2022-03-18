class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  before_action :require_user
  before_action :require_admin, except: [:index, :show]
  
  def new
    @category = Category.new
  end
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category name was edited successefully"
      redirect_to @category
    else
      render 'edit'
    end
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

  def show
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end
  
  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end
  
end