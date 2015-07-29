class DevelopersController < ApplicationController
	#before_action :require_signin, except: [:new, :create]
  # before_action :correct_user, only: [:edit, :update]
  #before_action :require_admin


  def index
    @developers = Developer.order("created_at DESC")
  end

  def show
    @developer = Developer.friendly.find(params[:id])
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      session[:developer_id] = @developer.id
      redirect_to @developer, notice: "You have successfully sign up!"
    else
      render :new
    end
  end

  def edit
    @developer = Developer.friendly.find(params[:id])
  end

  def update
    @developer = Developer.friendly.find(params[:id])
    if @developer.update(developer_params)
      redirect_to @developer #, notice: "Account successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @developer = Developer.friendly.find(params[:id])
    @developer.destroy
    session[:developer_id] = nil
    redirect_to root_url, alert: "Account successfully deleted!"
  end

  private

  def developer_params
    params.require(:developer).
      permit(:name, :email, :username, :password, :password_confirmation)
  end

  # def require_correct_developer
  #   @developer = User.find(params[:id])
  #   unless current_user?(@user)
  #     redirect_to root_url
  #   end
  # end
end

