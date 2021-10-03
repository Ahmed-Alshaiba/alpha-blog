class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(white_list)
    if @article.save
      flash[:notice] = "Article was created successefully"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(white_list)
      flash[:notice] = "Article was edited successefully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:notice] = "Article was deleted successefully"
    end
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def white_list
    params.require(:article).permit(:title, :description)
  end

end