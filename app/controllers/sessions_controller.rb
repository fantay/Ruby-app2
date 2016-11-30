class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user
            flash[:sucess] = "Sa marche, #{user.name}"
            log_in user
            redirect_to user
        else
          flash.now[:danger] = "Ta fais de la MERDE !!!!!"
          render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end
