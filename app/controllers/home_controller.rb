class HomeController < ApplicationController
  def index
  end
  
  def launch
    render :layout => 'launch'
  end
end
