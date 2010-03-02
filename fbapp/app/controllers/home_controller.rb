class HomeController < ApplicationController
  skip_before_filter :ensure_authenticated_to_facebook, :only=>:index
  def index
    
  end
end
