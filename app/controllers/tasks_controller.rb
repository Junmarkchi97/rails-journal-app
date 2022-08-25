class TasksController < ApplicationController
  before_action :get_category

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def show
    # @task = @category.tasks.find(params[:id])
  end
  
  def edit
    # @task = @category.tasks.find(params[:id])
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_tasks_path
    else
      render :new
    end
  end

  def update
    @task = @category.tasks.find(params[:id])
    @task.update(name: params[:task][:name], description: params[:task][:description])
    redirect_to category_tasks_path
  end

  # def update
  #   respond_to do |format|
  #     if @category.update(task_params)
  #       format.html { redirect_to category_task_url(@category), notice: "Task was successfully updated." }
  #       format.json { render :show, status: :ok, location: @category }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @task.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @task = @category.tasks.find(params[:id])
  #   @task.destroy
  #   redirect_to category_tasks_path
  # end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to category_task_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
