class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	# def current_user
   #  	Lender.find(session[:user_id]) if session[:user_id] || Borrower.find(session[:user_id]) if session[:user_id] 
  	# end
  	# helper_method :current_user

  	# def require_login
   #  	redirect_to '/' if session[:user_id] == nil
   #  end

   #  def require_correct_user
	  #   user = Lender.find(params[:id]) 
   #    user1 = Borrower.find(params[:id]) 
	  #  if current_user != user
   #      redirect_to "/" 
   #   elsif current_user != user1
   #      redirect_to "/"
   #    end
end
