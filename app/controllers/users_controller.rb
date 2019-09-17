class UsersController < ApplicationController
   before_action :authenticate_user!, except: [:show]
   
   def show
    @user=User.find_by(id: params[:id])
   end
   
end