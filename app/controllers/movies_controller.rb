class MoviesController < ApplicationController
    def index
        movies = Movie.all
        render json: movies, include: [:reviews], except: [:created_at, :updated_at]
    end


    def show
        movie = Movie.find_by(id: params[:id])
        render json: movie, include: [:reviews], except: [:created_at, :updated_at]
    end


    private

    def movie_params
        params.require(:movie).permit(:title, :original_title, :original_title_romanized, :image_url, :description, :director, :producer, :release_date, :run_time, :rt_score)
    end
    
end
