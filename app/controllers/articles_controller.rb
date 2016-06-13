class ArticlesController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    p @category
    @article = @category.articles.new(article_params)
    p @article
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      @errors = @article.errors.full_messages
      render 'new'
    end
  end
end
