class Api::V1::Projects::ProjectsController < ActionController::API
  def index
    render json: Project.all
  end

  def show
    render json: Project.find(params[:id])
  end
end
