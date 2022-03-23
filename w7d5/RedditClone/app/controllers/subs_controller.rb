class SubsController < ApplicationController

    before_action :mod, [:update, :edit]
    
    def index
        @sub = Sub.all
    end

    def new 
    end

    def show
        @sub = Sub.find(params[:id])
    end

    def create
        @sub = Sub.new(sub_params)
        if @sub.save
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    def edit 
        @sub = Sub.find(params[:id])
        render :edit
    end

    def update
        @sub = Sub.find(params[:id])
        if @sub.update(sub_params)
            redirect_to sub_url(@sub)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    # def moderator?
    #     @user.sub.any?(@sub)
    # end

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
