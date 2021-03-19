class YearsController < ApplicationController

    def show
        @year = params[:slug]
        @awards = Award.all
    end
end