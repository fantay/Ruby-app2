class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user
            flash[:sucess] = "Sa marche, #{user.name}"
            log_in user
            if params[:session][:remember_me] == '1'
                remember(user)
            else
                forget(user)
            end
            redirect_to user
        else
          flash.now[:danger] = "Ta fais de la MERDE !!!!!"
          render 'new'
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to home_path
    end

end
