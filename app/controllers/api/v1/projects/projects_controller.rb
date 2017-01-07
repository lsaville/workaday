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

  private
    def project_params
      params.require(:project).permit(:title, :details, :lat, :lng)
    end
end
