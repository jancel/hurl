class ForwardController < ApplicationController
  
  def redirectiones
    if params[:id].match(/-$/)
      if s = ShortUrl.by_hash(params[:id].chop)
        redirect_to short_url_path(s.id) and return 
      end
    elsif s = ShortUrl.url_by_hash(params[:id])
      RequestParser.new(request)
      redirect_to ShortUrl.url_by_hash(params[:id]), :status=>301 and return
    end
    
    # If we made it here, we apparently haven't found this request
    redirect_to page_path("error")
  end
end