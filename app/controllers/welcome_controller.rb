class WelcomeController < ApplicationController
  def index
    
    @families = Family.all
    
  end
end
