class SessionsController < ApplicationController
  def create
	user_lend = Lender.find_by(email: params[:email])
	user_borrow = Borrower.find_by(email: params[:email])
      if user_lend && user_lend.authenticate(params[:password])
        session[:user_id] = user_lend.id
        redirect_to "/lenders/#{user_lend.id}"
      elsif user_borrow && user_borrow.authenticate(params[:password])
        session[:user_id] = user_borrow.id
        redirect_to "/borrowers/#{user_borrow.id}"
      else 
        flash[:errors] = ['Invalid email/password']
        redirect_to '/'
      end 
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
