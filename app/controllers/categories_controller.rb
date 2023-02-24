class CategoriesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
  end

  def new
  end

  def create
    if @category.save
      redirect_to tasks_path(category_id: @category.id), notice: "Category created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update category_params
      redirect_to tasks_path(category_id: @category.id), notice: "Category updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to tasks_path, notice: "Category deleted successfully"
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
