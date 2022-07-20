class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  def index
    campers = Camper.all
    render json: campers, status: :ok
  end

  def show
    camper = find_camper
    render json: camper, serializer: CamperShowSerializer, status: :ok
  end

  def create
    
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def find_camper
    Camper.find(params[:id])
  end

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found
    render json: { error: "Camper not found" }, status: :not_found
  end

  def render_invalid(exception)
    render json: { errors: ["validation errors"] }, status: :unprocessable_entity
  end
end
