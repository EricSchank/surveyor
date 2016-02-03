class HomeController < ApplicationController
  before_filter :load_site
  before_filter :load_text

  def index
  end
end
