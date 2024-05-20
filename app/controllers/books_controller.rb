class BooksController < ApplicationController
   
  
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
       @user = current_user
       @books = Book.order(created_at: :desc)
       render :index
    end
  end

  def index
    @user = current_user
    @books = Book.order(created_at: :desc)
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
      @user = current_user
      @books = @user.books
    @new_book = Book.new
  end

  def edit
    
     @book = Book.find(params[:id])
      redirect_to books_path if current_user != @book.user

    
  end

    def update
      @book = Book.find(params[:id])

    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit

    end
   end

   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  end