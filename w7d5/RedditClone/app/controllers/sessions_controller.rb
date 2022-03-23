class SessionsController < ApplicationController

    # before_action :ensure_logged_in

    def new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if @user
            login!(@user)
            redirect_to users_url
        else
            flash[:errors] = "username & password invalid"
            redirect_to new_session_url
        end
    end

    def destroy
        logout!
        redirect_to users_url
    end

end
