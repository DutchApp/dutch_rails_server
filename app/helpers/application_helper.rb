module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def mask(data)
    '*' * (data.size - 4) + data[-4, 4] unless data.nil?
  end
end