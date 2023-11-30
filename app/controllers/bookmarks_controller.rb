class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to lists_path(@list)
    else
      redirect_to list_path(@list)
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
