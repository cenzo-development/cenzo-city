module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then "alert alert-info"
    when 'success' then "alert alert-success"
    when 'error' then "alert alert-danger"
    when 'alert' then "alert alert-warning"
    end
  end


  def set_value(errors, resource, field_name, field_value)
    if errors.blank? || !resource.errors[field_name]
      return field_value
    else
      resource.send(field_name) if resource.errors[field_name]
    end
  end

end
