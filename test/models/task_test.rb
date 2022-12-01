require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save when name is empty" do
    category = Category.create name: "sample name"
    task = category.tasks.build description: "sample description"
    assert_not task.save
  end

  test "name should be atleast 5 characters long" do
    category = Category.create name: "sample name"
    task = category.tasks.build description: "sample description", name: "aaa"
    assert_not task.save
  end

  test "deadline should be a past date" do
    category = Category.create name: "sample name"
    task = category.tasks.build description: "sample description", name: "sample name", deadline: 7.days.ago
    assert_not task.save
  end
end
