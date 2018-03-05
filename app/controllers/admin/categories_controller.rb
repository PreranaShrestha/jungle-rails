class Admin::CategoriesController < ApplicationController
  before_filter :authenticate
  def index
    @categories = Category.order(id: :desc).all
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = 'Categories created succesfully.'
      redirect_to :back
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end
