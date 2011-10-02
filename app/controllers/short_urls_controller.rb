class ShortUrlsController < ApplicationController

  def new
    @short_url = ShortUrl.new
  end
  
  # GET /short_urls/1
  # GET /short_urls/1.xml
  def show
    @short_url = ShortUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @short_url }
    end
  end
  
  
  # POST /short_urls
  # POST /short_urls.xml
  def create
    @short_url = ShortUrl.new(params[:short_url])
    
    respond_to do |format|
      if @short_url.save
        flash[:notice] = 'Short Url was successfully created.'
        format.html { redirect_to( :action => :show, :id => @short_url.id ) }
        format.xml  { render :xml => @short_url, :status => :created, :location => @short_url }
        # format.json  { render :json => { :short_url => @short_url, :html => render_to_string( :partial => 'ajax.html', :locals => { :data => @short_url }, :layout => false )}}
      else
        format.html { render :action => :new }
        format.xml  { render :xml => @short_url.errors, :status => :unprocessable_entity }
        # format.json { render :json => @short_url.errors }
      end
    end
  end
end
