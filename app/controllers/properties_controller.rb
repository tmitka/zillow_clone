class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
  end

  def create
    @property = Property.new property_params
    @property.user = User.find(session[:current_user_id])
    unless @property.save
      flash[:errors]= @property.errors.full_messages
      redirect_to '/properties/new'
    else
    redirect_to '/properties'
  end
  end

  def show
    @property = Property.find(params[:property_id])
    @agent = User.find(@property.user)
  end

  def edit
    @property = Property.find(params[:property_id])
  end

  def update
    @property = Property.find(params[:property_id])
    @property.update(property_params)
    @property.save
      redirect_to "/properties"
  end

  def destroy
    @property = Property.find(params[:property_id])
    @property.destroy
    redirect_to '/properties'
  end





  private
    def property_params
      params.require(:property).permit(:address, :bedrooms, :bathrooms, :zipcode, :price, :rent, :description, :user, :longitude, :latitude, :sq_ft)
    end
end
