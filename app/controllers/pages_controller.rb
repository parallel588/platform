class PagesController < ApplicationController


  def show
    @page_name = params[:content_page_name]
    if template_exists?("content/#{@page_name}")
      render "content/#{@page_name}"    
    else
      raise ActionController::RoutingError.new('Not Found')
    end    
  end


end
