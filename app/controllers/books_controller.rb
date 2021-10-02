class BooksController < ApplicationController


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
    render :index
    end
  end

   def index
    @books = Book.all
    @book = Book.new

   end



   def show
    @book = Book.find(params[:id])

   end

   def edit
    @book = Book.find(params[:id])


   end

  def update
    book = Book.find(params[:id])
    book.update(books_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book)

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to "/books"
  end

end

private

def books_params
  params.require(:book).permit(:title, :body)
end