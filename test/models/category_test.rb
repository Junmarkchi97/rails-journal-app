require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do 
    @normalFormat = categories(:normalFormat)
    @DescLessThan10Char = categories(:DescLessThan10Char)
    @DescMoreThan100Char = categories(:DescMoreThan100Char)
    @NameMoreThan20Char = categories(:NameMoreThan20Char)
  end
  
  test "should be able to add new category" do
    category = Category.create(name: @normalFormat.name, description: @normalFormat.description)
    assert category.save, "Created a new category"
  end

  test "should be able to reject a category with empty name" do
    category = Category.create(description: @normalFormat.description)
    assert_not category.save, "Saved category without name"
  end

  test "should be able to reject a category with name longer than 20 chars" do
    category = Category.create(name: @NameMoreThan20Char.name, description: @NameMoreThan20Char.description)
    assert_not category.save, "Saved category with name longer than 20chars"
  end

  test "should be able to reject a category with empty description" do
    category = Category.create(name: @normalFormat.name)
    assert_not category.save, "Saved category without description"
  end

  test "should be able to reject a category with description shorter than 10 chars" do
    category = Category.create(name: @DescLessThan10Char.name, description: @DescLessThan10Char.description)
    assert_not category.save, "Saved category with description shorter than 10chars"
  end

  test "should be able to reject a category with description greater than 100 chars" do
    category = Category.create(name: @DescMoreThan100Char.name, description: @DescMoreThan100Char.description)
    assert_not category.save, "Saved category with description larger than 100chars"
  end
end
