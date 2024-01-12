class FavoritesController < ApplicationController

  def create
    @blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.create(blog_id: @blog.id)
    favorite.save
    # jsファイルを呼び出す
    respond_to do |format|
      format.js { render :create }
    end
    # redirect_to blogs_path
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    current_user.favorites.find_by(id: params[:id]).destroy
    # jsファイルを呼び出す
    respond_to do |format|
      format.js { render :destroy }
    end
    # redirect_to blogs_path
    # favorite = current_user.favorites.find_by(book_id: book.id)
    # favorite.destroy
  end
end