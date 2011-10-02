class ForwardController < ApplicationController
  
  # def stats
  #   raise "Shouldn't be here (Stats)"
  # end
  # 
  # def spam
  #   raise "Shouldn't be here (spam)"
  # end
  
  def redirectiones
    RequestParser.new(request)
    redirect_to ShortUrl.url_by_hash(params[:id]), :status=>301
  end
end