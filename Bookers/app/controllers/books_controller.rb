class BooksController < ApplicationController
  protect_from_forgery except: :create
  def top
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render 'index'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Books was successfully updated."
      redirect_to book_path(book)
    else
      flash[:notice] = "Books was not successfully updated."
      redirect_to book_path(book)
    end
  end
  def destroy
    book = Book.find(params[:id]) #データ(レコード)を1件取得
    if book.destroy #データ（レコード）を削除
      redirect_to books_path, notice: "Books was successfully destroyed."
    else
      flash[:notice] = "Books was not successfully destroyed."
      render books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
