class ReviewsController < ApplicationController
    def index
        reviews = Review.all
        render json: reviews, except: [:created_at, :updated_at]
    end

    def show
        review = Review.find_by(id: params[:id])
        render json: review, except: [:created_at, :updated_at]
    end

    def create
        review = Review.create(review_params)
        render json: review
    end

    def update
        review = Review.find_by(id: params[:id])
        review.update(review_params)
        render json: review
    end

    def destroy
        review = Review.find_by(id: params[:id]) 
        review.destroy
        # render status :ok
    end

    
    

    private

    def review_params
        params.require(:review).permit(:id, :title, :content, :score, :user_id, :movie_id)
    end
end
