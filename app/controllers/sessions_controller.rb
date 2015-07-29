class SessionsController < ApplicationController

	def new
  end

  def create
	  if developer = Developer.authenticate(params[:email], params[:password])
	    session[:developer_id] = developer.id
	    # if params[:remember_me]
	    #   cookies.permanent[:auth_token] = developer.auth_token
	    # else
	    #   cookies[:auth_token] = developer.auth_token
	    # end
	    flash[:notice] = "Welcome back, #{developer.name}!"
	    redirect_to (session[:intended_url] || developer)
	    session[:intended_url] = nil
	  else
	    flash.now[:alert] = "Invalid email/password combination!"
	    render :new
	  end
  end

  def destroy
    # cookies.delete(:auth_token)
    session[:developer_id] = nil
    redirect_to root_url, notice: "You're now signed out!"
  end
end
