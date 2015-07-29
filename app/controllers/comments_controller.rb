class CommentsController < ApplicationController

	before_action :set_project

  def index
    @comments = @project.comments
  end

  def new
    @comment = @project.comments.new
  end

  def create
    @comment = @project.comments.new(comment_params)
    #@comment.user = current_user
      if @comment.save
      redirect_to project_path(@project),
                    notice: "Thanks for your comment!"
    else
      render :new
    end
  end

  def destroy
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project), notice: "Review successfully deleted!"
  end


  private

  def comment_params
    params.require(:comment).permit(:name, :email, :remark)
  end

  def set_project
    @project = Project.friendly.find(params[:project_id])
  end
end
