class PagesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

end
