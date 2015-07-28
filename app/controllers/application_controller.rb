class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :expire_hsts

   private

  def require_signin
    unless current_developer
      session[:intended_url] = request.url
      redirect_to new_session_url, alert: "Please sign in first!"
    end
  end

  def current_developer
    #@current_developer ||= Developer.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
    @current_developer ||= Developer.find(session[:developer_id]) if session[:developer_id]
  end

  helper_method :current_developer

  def current_developer?(developer)
    current_developer == developer
  end
  helper_method :current_developer?



  def correct_developer
    @developer = Developer.friendly.find(params[:id])
    unless current_developer?(@developer)
      redirect_to root_url
    end
  end

  def correct_developer?
     #current_developer == correct_developer
     @correct_developer == @developer
  end
  helper_method :correct_developer?


  def require_admin
    unless current_developer_admin?
      redirect_to root_url, alert: "Unauthorized access!!"
    end
  end

  def current_developer_admin?
   current_developer && current_developer.admin?
  end
  helper_method :current_developer_admin?

  def expire_hsts
    response.headers["Strict-Transport-Security"] = 'max-age=0'
  end
end
