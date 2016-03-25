class BorrowersController < ApplicationController
  def index
  end

  def create
  	borrower = Borrower.new(first_name: borrower_params[:first_name], last_name: borrower_params[:last_name], email: borrower_params[:email], 
  				password: borrower_params[:password], password_confirmation: borrower_params[:password_confirmation], 
  				purpose: borrower_params[:purpose], description: borrower_params[:description], money: borrower_params[:money], raised: 0)
    if borrower.save
        session[:user_id] = borrower.id
        redirect_to "/borrowers/#{borrower.id}"
    else 
      flash[:errors] = borrower.errors.full_messages
      redirect_to "/online_lending/register"
    end
  end

  def show
    @borrower = Borrower.find(session[:user_id])
    @history = History.where(borrower_id: session[:user_id])

  end

  def edit

   
  end

  def update
  end
 private
    def borrower_params
      params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :purpose, :description, :money)
    end
end
