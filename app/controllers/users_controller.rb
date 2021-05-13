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

    def auth
        user = User.find_by(username: params[:username])
        if user
            if params[:password] == user.password
                render json: user, except: [:created_at, :updated_at, :password]
            else
                render json: {error: "Password doesn't match user"}
            end
        else
            render json: {error: "Username Not  Found"}    
        end
        
        
    end
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
