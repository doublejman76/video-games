class PagesController < ApplicationController
    
    def home
        redirect_to video_games_path if logged_in?
    end

    def about
        
    end


end
