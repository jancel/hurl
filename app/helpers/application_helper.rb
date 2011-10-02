module ApplicationHelper
  
  def host
    "http://#{APP_CONFIG['host']}"
  end
end
