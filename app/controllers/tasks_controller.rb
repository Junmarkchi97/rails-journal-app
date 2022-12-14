class TasksController < ApplicationController
  before_action :get_category

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to category_tasks_path
    else
      render :new, status: 422
    end
  end

  def edit
    @task = @category.tasks.find(params[:id])
  end

  def update
    @task = @category.tasks.find(params[:id])
    @task.update(name: params[:task][:name], details: params[:task][:details], due_date: params[:task][:due_date])
    redirect_to category_tasks_path
  end

  def show
    @task = @category.tasks.find(params[:id])
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_tasks_path
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :details, :category_id, :due_date)
  end
end