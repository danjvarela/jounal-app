module CustomDeviseHelper
  def has_attr_error(attribute)
    !!resource && !resource.errors[attribute].empty?
  end

  def get_attr_error(attribute)
    return "" if !resource && resource.errors[attribute].empty?
    "#{attribute.to_s.humanize} #{resource.errors[attribute].first}"
  end
end
