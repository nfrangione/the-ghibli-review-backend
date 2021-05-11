class UsersController < ApplicationController
    def index
        users = User.all
        render json: users, only: [:username, :password]
    end
    
    def show
        user = User.find_by(id: params[:id])
        render json: user, except: [:created_at, :updated_at]
    end

    def create
        user = User.create(user_params)
        render json: user, except: [:created_at, :updated_at]
    end

    private

    def user_params
        params.require(:user).require(:username, :password)
    end
end
