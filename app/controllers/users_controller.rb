class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @combination = Combination.all
    end

    def iine
        @user = User.find(params[:id]) 
        @combination = Combination.all
    end
end