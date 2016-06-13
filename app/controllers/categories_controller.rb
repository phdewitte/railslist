class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    p params
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
    else
      @errors = @category.errors.full_messages
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  private
    def category_params
      params.require(:category).permit(:title, :creator_id)
    end
end
