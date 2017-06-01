class FavoritesController < ApplicationController

def new
@fav = Favorite.new(user:User.find(session[:current_user_id]), property:Property.find(params[:id]))
if @fav.save
  redirect_to '/properties'
  flash[:success] = "Favorited!"
else
  redirect_to '/properties'
end
end
end
