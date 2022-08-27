require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:normalFormat)
    get '/users/sign_in'
    sign_in users(:user)
    post user_session_url
  end

  # test "should get index" do
  #   get category_tasks_url
  #   assert_response :success
  # end

  test "should get index" do
    get category_tasks_path(@task)
    assert_response :success
  end

  test "should get new" do 
    get new_category_task_path(@task)
    assert_response :success
  end

  # test "should create task" do
  #   assert_difference("Task.count") do
  #     post category_tasks_path(@task), params: { task: { name:@task.name,  details:@task.details, due_date: @task.due_date } }
  #   end

  #   assert_redirected_to category_tasks_path(@task)
  # end

  # test "should get edit" do
  #   get edit_category_task_path(@category)
  #   assert_response :success
  # end
end
