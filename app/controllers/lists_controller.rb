class ListsController < ApplicationController
  def index
    @lists = List.all.order(:created_at)
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render 'new'
    end

  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to lists_path
    else
      render 'edit'
    end
  end


  private

  def list_params
    params.require(:list).permit(:name)

  end
end
