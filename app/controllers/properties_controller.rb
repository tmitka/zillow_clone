class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new
  end

  def create
    @property = Property.new property_params
    unless @property.save
      flash[:errors]= @property.errors.full_messages
    end
    redirect_to '/properties'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @property = Property.find(params[:property_id])
    @property.destroy
    redirect_to '/properties'
  end

  private
    def property_params
      params.require(:property).permit(:address, :bedrooms, :bathrooms, :zipcode, :price, :rent, :description, :longitude, :latitude, :sq_ft)
    end
end
