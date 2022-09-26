class PlantsController < ApplicationController

    wrap_parameters format: []

    def index
        all_plants = Plant.all
        render json: all_plants, except: [:created_at, :updated_at], status: :ok
    end

    def show
        specific_plant = Plant.find(params[:id])
        render json: specific_plant, except: [:created_at, :updated_at], status: :ok
    end

    def create
        send_it = Plant.create(plant_params)
        render json: send_it, except: [:created_at, :updated_at], status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end
end
