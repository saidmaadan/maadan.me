class ProjectsController < ApplicationController
  #before_action :require_signin, except: [:new, :create]
  # before_action :correct_user, only: [:edit, :update]
  before_action :require_admin, except: [:index, :show]
	
	def index
		@projects = Project.order("created_at DESC")
	end


  def show
  	@comment = Comment.new
  	@projects = Project.toShuffle
    @project = Project.friendly.find(params[:id])
    @comment.project_id = @project_id
    @comments = Comment.where(project_id: @project.id).order("created_at DESC")
  end
    
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			redirect_to @project
		else
			render :new
		end
	end

	def edit
		@project = Project.friendly.find(params[:id])
	end

	def update
		@project = Project.friendly.find(params[:id])
		if @project.update(project_params)
			redirect_to @project, notice: "Project updated successfully"
		else
			render :edit
		end
	end

	def destroy
		@project = Project.friendly.find(params[:id])
		@project.destroy
		redirect_to projects_url, notice: "Project has been destroyed successfully"
	end

	private
	def project_params
		params.require(:project).permit(:name, :description, :url, :github, :builtwith, :screenshot, :roles)
	end
end
