class ArtworksController < ApplicationController 
    def index
        # artwork = Artwork.all
        # render json: artwork
        if params[:user_id]
            render json: Artwork.joins(:artwork_shares).where("artworks.artist_id = #{params[:user_id]} OR artwork_shares.viewer_id = #{params[:user_id]}")
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork 
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            # redirect_to "/users/#{user.id}"
            redirect_to artwork_url(artwork.id)
        else
            render json: artwork.errors.full_messages, status: unprocessable_entity
        end
    end


    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: artwork
    end

    private 

    def artwork_params
        params.require(:artwork).permit(:artist_id, :title, :image_url)
    end



end #end of class 