class LendersController < ApplicationController
  def index
  end

  def create
    lender = Lender.new(lender_params)
    if lender.save
        session[:user_id] = lender.id
        redirect_to "/lenders/#{lender.id}"
    else 
      flash[:errors] = lender.errors.full_messages
      redirect_to "/online_lending/"
    end
  end

  def show
    @lender = Lender.find(session[:user_id])
    @borrowers = Borrower.all
    lend_id = session[:user_id] 
    @history = History.where(lender_id: session[:user_id])

  end

  def edit

  end

  def update
    amt = params[:amount].to_i
    borrow_amt = Borrower.find(params[:borrower_id]).raised.to_i
    lend_amt = Lender.find(session[:user_id]).money.to_i

    if borrow_amt > 0 || lend_amt > 0
      new_borrow = borrow_amt + amt
      Borrower.find(params[:borrower_id]).update(raised:new_borrow)

      new_lend = lend_amt - amt
      Lender.find(session[:user_id]).update(money: new_lend)

      History.create(amount: amt, lender_id: session[:user_id], borrower_id: params[:borrower_id])

      redirect_to "/lenders/#{session[:user_id]}" 
    else 
      flash[:errors] = ["Insufficient Funds"]
      redirect_to "/lenders/#{session[:user_id]}" 
    end
  end
 private
    def lender_params
      params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :money)
    end
end
