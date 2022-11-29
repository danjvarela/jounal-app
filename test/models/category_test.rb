require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should not save when name is empty" do
    category = Category.new
    assert_not category.save
  end

  test "name should be atleast 5 characters long" do
    category = Category.new name: "aaa"
    assert_not category.save
  end
end
