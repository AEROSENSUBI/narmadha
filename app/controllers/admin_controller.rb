class AdminController < ApplicationController
  def index
  end

  def settings
  	render  :action => '_settings'
  end
end
