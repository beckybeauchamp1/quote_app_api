class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render status: 200, json: @categories
  end

  def show
    @category = Category.find(params[:id])
    render status: 200, json: @category
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      render status: 200, json: @category.to_json
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      render status: 200, json: @category.to_json
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      render status: 200, json: @quotes.to_json
    end
  end

  private
  def category_params
    params.require(:category).permit(:text, :author, :created_at, :updated_at)
  end

end
