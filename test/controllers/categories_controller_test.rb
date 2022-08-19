require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category1 = categories(:one) #below 10char description
    @category2 = categories(:two) #above 100char description
    @category3 = categories(:three) #standard format
  end

  # test "should get index" do
  #   get categories_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_category_url
  #   assert_response :success
  # end

  # test "should be able to create a category" do
  #   # debugger
  #   assert_difference("Category.count") do
  #     post categories_url, params: { category: { description: @category.description, name: @category.name } }
  #   end

  #   assert_redirected_to category_url(Category.last)
  #   assert_not_empty Category.all
  # end

  # test "should show category" do
  #   get category_url(@category)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: { description: @category.description, name: @category.name } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference("Category.count", -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end

  test "should be able to create a category" do
    category = Category.create(name: @category3.name, description: @category3.description)
    assert category.save, "Created a new category"
  end

  test "should be able to reject a category with empty name" do
    category = Category.create(description: @category3.description)
    assert_not category.save, "Saved category without name"
  end

  test "should be able to reject a category with name longer than 20 chars" do
    category = Category.create(name: @category2.name, description: @category2.description)
    assert_not category.save, "Saved category with name longer than 20chars"
  end

  test "should be able to reject a category with empty description" do
    category = Category.create(name: @category2.name)
    assert_not category.save, "Saved category without description"
  end

  test "should be able to reject a category with description shorter than 10 chars" do
    category = Category.create(name: @category1.name, description: @category1.description)
    assert_not category.save, "Saved category with description shorter than 10chars"
  end

  test "should be able to reject a category with description greater than 100 chars" do
    category = Category.create(name: @category2.name, description: @category2.description)
    assert_not category.save, "Saved category with description larger than 100chars"
  end

  test "should be able to show a category and tasks associated to it" do
    get category_url(@category3)
    assert_response :success
  end

  test "should be able to reject GET requests to categories that current user doesn't own" do
  end

  test "should be able to update a category" do
    patch category_url(@category3), params: { category: { description: @category3.description, name: @category3.name } }
    assert_redirected_to category_url(@category3)
  end

  test "should be able to reject a category update for empty name" do
  end

  test "should be able to reject a category update for name chars greater than 20" do
  end

  test "should be able to reject a category update for empty description" do
  end

  test "should be able to reject a category update for empty description shorter than 10 chars" do
  end
  
  test "hould be able to reject a category update for empty description greater than 100 chars" do
  end

end
