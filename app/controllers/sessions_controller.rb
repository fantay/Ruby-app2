class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)

        if user && user.authenticate(params[:session][:password])
            flash[:sucess] = "Sa marche, #{user.name}"
            if user.activated?
                log_in user
                params[:session][:remember_me] == '1' ? remember(user) : forget(user)
                redirect_to user
            else
                message = "Ta fais de la MERDE !!!!!"
                message += "Check your mail"
                flash[:warning] = message
                redirect_to root_url
            end
        end
    end

    def destroy
        log_out if logged_in?
        redirect_to home_path
    end

end
