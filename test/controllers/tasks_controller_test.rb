require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    get "/users/sign_in"
    sign_in users :one
    post user_session_url
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should post create" do
    task = @category.tasks.build name: "sample name", description: "sample description"
    post category_tasks_path(@category), params: {task: task.attributes}
    assert_response :redirect
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should put/patch update" do
    new_task = @category.tasks.build name: "new sample name", description: "new sample description"
    put category_task_path(@category, @task), params: {task: new_task.attributes}
    assert_response :redirect
    patch category_task_path(@category, @task), params: {task: new_task.attributes}
    assert_response :redirect
  end

  test "should get show" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should delete destroy" do
    delete category_task_path(@category, @task)
    assert_response :redirect
  end
end
