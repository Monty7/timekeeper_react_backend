class UsersController < ApplicationController

    # def index
    #     users = User.all 
    #     render json: {users: users}
    # end


    def create
      #  binding.pry
        if params[:name] != ""
            user = User.find_or_create_by(user_params)
            render json: user, include: :user_times

        else
            render json: {err_message: "Name cannot be blank!"}
        end
    end

    def show
       # binding.pry
        user = User.find_by(id: params[:id])
        render json: user, include: :user_times
       # binding.pry
    end


    private
    
    def user_params
        params.require(:user).permit(:name)
    end
end
