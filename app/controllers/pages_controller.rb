class PagesController < ApplicationController
  def index
    puts "in index method yo"
    @pages = Page.all 

    # although we don;t rails automatically does this for us 
    #rails is going to look for index.html.erb in the views/pages folder
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    # go to a folder views/pages/new.html
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if(@page.update(pages_params))
      redirect_to pages_params
    else
      render :edit
    end
  end

  def destroy
    @pages = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path
  end

  def destroy
    Page.find(params[:id]).destroy
    redirect_to pages_path
  end

  def create
    @page = Page.new(pages_params)
    if @page.save
      redirect_to pages_path
    else
      render :new
    end
  end

  private

  def pages_params
    params.require(:page).permit(:subject, :author, :note)
  end
end