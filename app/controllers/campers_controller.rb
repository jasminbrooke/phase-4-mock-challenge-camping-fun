class CampersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by!(id: params[:id])
        render json: camper, include: :activities
    end

    def create
        camper = Camper.create(camper_params)
        if camper.valid?
            render json: camper, include: :activities, status: :created
        else
            render json: {errors: camper.errors.full_messages }, status: :unprocessable_entity
        end
    end

    private

    def not_found_response
        render json: { error: 'Camper not found'}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end
end
