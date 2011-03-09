class HomeController < ApplicationController
  def index
    @articles = Article.recent
    @activities = Activity.all
  end

end
