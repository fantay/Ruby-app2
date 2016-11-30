class ApplicationController < ActionController::Base

    include SessionsHelper
    
    protect_from_forgery with: :exception

    def  bonjour
        render html: "bonjour bienvenu sur le super serveur"
    end

end
