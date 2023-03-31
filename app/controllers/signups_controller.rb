class SignupsController < ApplicationController

    # def create
    #     camper = Camper.create(camper_params)
    #     if camper.valid?
    #         render json: camper, include: :activities, status: :created
    #     else
    #         render json: {errors: camper.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end

    def create
        signup = Signup.create(signup_params)
        if signup.valid?
            render json: signup.activity, status: :created
          else
            render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
          end
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end
end
