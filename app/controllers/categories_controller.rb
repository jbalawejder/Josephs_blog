class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
      @category = Category.new(category_params)
      if @category.save
      redirect_to categories_path(@category)
      else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def category
    @category = Category.find(params[:id])
  end

end
