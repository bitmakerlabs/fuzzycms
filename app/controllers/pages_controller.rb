class PagesController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      flash[:notice] = "Your page was created successfully"
      redirect_to pages_path
    else
      render :action => "new"
    end
  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])

    if @page.save
      flash[:notice] = "Your page was successfully update"
      redirect_to pages_path
    else
      render :action => "edit"
    end
  end

  def destroy
    Page.destroy(params[:id])
    redirect_to pages_path
  end

end
