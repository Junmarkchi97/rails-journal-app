require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get categories_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_category_task_url
    assert_response :success
  end

  # test "should create tasks" do
  #   assert_difference("Category.count") do
  #     post categories_url, params: { category: { name: @category.name } }
  #   end

  #   assert_redirected_to category_url(Category.last)
  # end

  test "should show tasks" do
    get category_task_url(@task)
    assert_response :success
  end

end
