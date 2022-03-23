class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
    
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to new_user_url
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def index
        @users = User.all
    end

    # def destroy
    #     @user = User.find(params[:id])
    
    # end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
