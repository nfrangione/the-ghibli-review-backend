class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find_by(id: params[:id])
    end


    private

    def movie_params
        params.require(:movie).require(:title, :original_title, :original_title_romanized, :image_url, :description, :director, :producer, :release_date, :run_time, :rt_score)
    end
    
end
