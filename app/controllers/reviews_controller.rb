class ReviewsController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find_by(id: params[:id])
    end
    
    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(params[:movie])
        if @movie.save
          flash[:success] = "Object successfully created"
          redirect_to @movie
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end
    
    
    

end
