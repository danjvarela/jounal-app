require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save when name is empty" do
    task = Task.new
    assert_not task.save
  end

  test "name should be atleast 5 characters long" do
    task = Task.new name: "aaa"
    assert_not task.save
  end
end
