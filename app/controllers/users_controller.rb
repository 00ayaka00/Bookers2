class UsersController < ApplicationController
  before_action :set_user, only: [:show, :index, :edit]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    #@users = Book.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @users = User.all
    @books = Book.all
    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])
    redirect_to user_path(current_user) if current_user != @user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

 def update

    @user = User.find(params[:id])
　　redirect_to edit_user_path(current_user) if current_user != @user

    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit

    end

  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
  
   def set_user
    @user = current_user || User.new
  end


end
