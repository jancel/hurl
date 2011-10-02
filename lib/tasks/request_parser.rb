class RequestParser
  attr :request
  
  def initialize( request )
    if Rails.env != "test"
      raise "#{self.class} requires an ActionDispatch::Request" if !request.class == ActionDispatch::Request
    end
    
    @request = request
    
    # We get here if a request is successfully passed in
    Statistic.create!(
      :host => host,
      :host_with_port => host_with_port,
      :referrer => referrer,
      :path => path,
      :url_hash => url_hash,
      :ip_address => ip_address,
      :user_agent => user_agent,
      :language => language
    )
  end
  
  def host_with_port
    "#{host}:#{port}"
  end
  
  def host
    @request.host
  end
  
  def port
    @request.port
  end
  
  def referrer
    @request.referrer
  end
  
  def path
    @request.path
  end
  
  def url_hash
    @request.path.blank? ? nil : @request.path.gsub(/^\//,"")
  end
  
  def ip_address
    @request.ip
  end
  
  def user_agent
    @request.user_agent
  end
  
  def language
    @request.accept_language
  end
  
  #"Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:7.0) Gecko/20100101 Firefox/7.0" 
  #^(.*)\((.*);(.*);(.*)\)(.*)\s(.*)\/(.*)$
  # 0 Mozilla/5.0
  # 1 Macintosh
  # 2 Intel Mac OS X 10.6
  # 3 rv:7.0
  # 4 Gecko/20100101
  # 5 Firefox
  # 6 7.0

  # Mozilla/5.0 (Windows NT 6.1; rv:6.0.2) Gecko/20100101 Firefox/6.0.2
  # Mozilla/5.0
  # Windows NT 6.1
  # rv:6.0.2
  #  
  # Gecko/20100101
  # Firefox
  # 6.0.2

  
  
  
    
end