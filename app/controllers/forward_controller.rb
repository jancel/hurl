class ForwardController < ApplicationController
  
  def redirectiones
    if params[:id].match(/-$/)
      s = ShortUrl.by_hash(params[:id].chop)
      redirect_to short_url_path(s.id) and return
    elsif s = ShortUrl.url_by_hash(params[:id])
      RequestParser.new(request)
      redirect_to ShortUrl.url_by_hash(params[:id]), :status=>301
    else
      error_page
    end
  end
end