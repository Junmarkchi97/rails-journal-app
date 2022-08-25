require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  setup do
    @lessThan3Char = categories(:lessThan3Char)
    @moreThan20Char = categories(:moreThan20Char)
  end

  test "should reject category with no name" do
    category = Category.create()

    assert_not category.save, "Saved category without name"
  end

  test "should reject category with name less than 3 characters" do
    category = Category.create(name: @lessThan3Char.name)

    assert_not category.save, "Saved category with less than 3 characters"
  end

  test "should reject category with name more than 20 characters" do
    category = Category.create(name: @moreThan20Char.name)
    
    assert_not category.save, "Saved category with more than 20 characters"
  end
end
