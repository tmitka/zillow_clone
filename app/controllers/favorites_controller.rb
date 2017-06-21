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

def index
  @properties = []
  @favorites = Favorite.where(user:session[:current_user_id])
  @favorites.each do |fav|
    puts fav.property
    @properties.append(Property.find(fav.property))
end

def destroy
  @fav = Favorite.where(user:User.find(session[:current_user_id]), property:Property.find(params[:property_id]))
  redirect_to '/favorites'
end
