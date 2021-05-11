class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies, only: [:id, :title, :release_date, :image_url]
    end

    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie, except: [:created_at, :updated_at]
    end


    private

    def movie_params
        params.require(:movie).require(:title, :original_title, :original_title_romanized, :image_url, :description, :director, :producer, :release_date, :run_time, :rt_score)
    end
    
end
