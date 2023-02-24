module TasksHelper
  def categorized?
    action_name.include? "categorized"
  end

  def infer_form_url
    url_map = {
      new_categorized: @category ? category_tasks_path(@category) : nil,
      new: tasks_path,
      edit: @category ? task_path(@category) : nil
    }
    url_map[action_name.to_sym]
  end
end
