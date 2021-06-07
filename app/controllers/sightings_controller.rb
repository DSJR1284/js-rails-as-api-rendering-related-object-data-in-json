class SightingsController < ApplicationController

    # Include option method
    # def index
    #     sightings = Sighting.all
    #     render json: sightings, include: [:bird, :location]
    #   end

    # Without the rails magic 
    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
      end
      
    #   def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting.to_json(include: [:bird, :location])
    #   end

    # Error Handling 
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     if sighting
    #       render json: sighting.to_json(include: [:bird, :location])
    #     else
    #       render json: { message: 'No sighting found with that id' }
    #     end
    #   end

    # Nest Example 
    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting.to_json(:include => {
          :bird => {:only => [:name, :species]},
          :location => {:only => [:latitude, :longitude]}
        }, :except => [:updated_at])
      end



    # def show 
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting
    # end 
    
    # Custom Hash 
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: { id: sighting.id, bird: sighting.bird, location: sighting.location }
    #   end

    #   Include option Method
    # def show
    #     sighting = Sighting.find_by(id: params[:id])
    #     render json: sighting, include: [:bird, :location]
    #   end

end
