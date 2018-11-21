class ProjectController < ApplicationController
  def index
    @projects = Project.all.order(:id)
  end


  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @is_auth = User.find(current_user.id)
    project_id = params[:project_id]
    @project = Project.includes(:project_users).includes(:users).find(project_id)
    @columns = Column.where(project_id: project_id).includes(:cards)
    #raise
  end

  def edit
    project_id = params[:project_id]
    @project = Project.find(project_id)
  end

  def update
    project_id = params[:project_id]
    @project = Project.find(project_id)
    if @project.update_attributes(project_params)
      redirect_to "/project/#{@project.id}"
    else
      render 'edit'
    end

  end

  def destroy
  end

  private

    def project_params
      params.require(:project).permit(:title, :content)
    end
end
