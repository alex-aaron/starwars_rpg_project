class StaticController < ApplicationController

    def home
        if user_signed_in? 
            @user = current_user
            if !current_user.awards_name
                @awards_name_present = false
            else
                @awards_name_present = true
            end
        else
            @award_name_present = true
        end
    end
end