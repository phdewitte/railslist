class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @article = @category.articles.new
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)
    if @article.save
      redirect_to category_article_path(@category.id, @article.id)
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    redirect_to category_article_path(@category, @article)
  end

  def show
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:category_id])
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to category_path(@category)
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :price, :author_id)
  end
end
