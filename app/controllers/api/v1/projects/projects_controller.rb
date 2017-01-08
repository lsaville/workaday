class Api::V1::Projects::ProjectsController < ActionController::API
  def index
    render json: Project.all
  end

  def show
    render json: Project.find(params[:id])
  end

  def create
    project = Project.new(project_params)
    project.save
    render json: project, status: 201
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    project.save
    render json: project, status: 200
  end

  def destroy
    project = Project.find(params[:id])
    project.delete
    render json: project, status: 200
  end

  private
    def project_params
      params.require(:project).permit(:title, :details, :lat, :lng)
    end
end
