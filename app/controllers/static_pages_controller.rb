class StaticPagesController < ApplicationController
  def index
  end
  
  def landing_page
  	@product = Product.limit(3)
  end
end
