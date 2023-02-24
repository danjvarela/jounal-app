class TasksController < ApplicationController
  include TasksHelper
  before_action :authenticate_user!
  before_action :get_category
  before_action :get_task, only: [:edit, :update, :destroy, :show]

  def index
    @tasks = @category.blank? ? current_user.tasks : @category.tasks
  end

  def new
    @task = Task.new category: @category
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to tasks_path(category_id: @task.category.id), notice: "Task updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to tasks_path(category_id: @category), notice: "Task created successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice: "Task deleted successfully"
  end

  private

  def get_category
    return unless params[:category_id]
    @category = Category.find_by(id: params[:category_id])
    head :forbidden if @category && cannot?(:read, @category)
  end

  def get_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :category_id)
  end
end
