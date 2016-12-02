class ApplicationController < ActionController::Base

    include SessionsHelper

    protect_from_forgery with: :exception

    def  bonjour
        render html: "bonjour bienvenu sur le super serveur"
    end


    private


    def logged_in_user
      unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
      end
    end


end
