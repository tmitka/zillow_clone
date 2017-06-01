class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    if current_user
    @user = User.find(current_user)
    puts "*************"
    puts current_user
    puts current_user.id
    puts @user
    puts @user.agent
    puts "************"
    end
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
    @property = Property.find(params[:property_id])
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
      params.require(:property).permit(:address, :bedrooms, :bathrooms, :zipcode, :price, :rent, :description, :longitude, :latitude, :sq_ft, :user_id)
    end
end
