class CategoriesController < ApplicationController
  before_action :get_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      redirect_to categories_path, success: "Category created succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update category_params
      redirect_to categories_path, success: "Category updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: "Category deleted successfully"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def get_category
    @category = Category.find params[:id]
  end
end
