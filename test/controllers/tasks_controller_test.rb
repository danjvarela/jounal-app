require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    category = Category.create name: "sample name"
    get category_tasks_path(category)
    assert_response :success
  end

  test "should get new" do
    category = Category.create name: "sample name"
    get new_category_task_path(category)
    assert_response :success
  end

  test "should post create" do
    category = Category.create name: "sample name"
    task = category.tasks.build name: "sample name", description: "sample description"
    post category_tasks_path(category), params: {task: task.attributes}
    assert_response :redirect
  end

  test "should get edit" do
    category = Category.create name: "sample name"
    task = category.tasks.create name: "sample name", description: "sample description"
    get edit_category_task_path(category, task)
    assert_response :success
  end

  test "should put/patch update" do
    category = Category.create name: "sample name"
    task = category.tasks.create name: "sample name", description: "sample description"
    new_task = category.tasks.build name: "new sample name", description: "new sample description"
    put category_task_path(category, task), params: {task: new_task.attributes}
    assert_response :redirect
    patch category_task_path(category, task), params: {task: new_task.attributes}
    assert_response :redirect
  end

  test "should get show" do
    category = Category.create name: "sample name"
    task = category.tasks.create name: "sample name", description: "sample description"
    get category_task_path(category, task)
    assert_response :success
  end

  test "should delete destroy" do
    category = Category.create name: "sample name"
    task = category.tasks.create name: "sample name", description: "sample description"
    delete category_task_path(category, task)
    assert_response :redirect
  end
end
