class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    if current_user
    @user = User.find(current_user)

    end

  end

  def interior
  end

  def exterior
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.create(property_params)
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
    @images = @property.images
    @agent = User.find(@property.user_id)
    @favorited = Favorite.where(user:session[:current_user_id] ,property:params[:property_id])
    @map = google_map(@property.address)
    puts @map
  end

  def edit
    @property = Property.find(params[:property_id])
    @property_id = params[:property_id]
    puts @property_id

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
      params.require(:property).permit(:address, :bedrooms, :bathrooms, :zipcode, :price, :rent, :description, :user_id, :longitude, :latitude, :sq_ft, :image)
    end

    def google_map(center)
      "https://maps.googleapis.com/maps/api/staticmap?center=#{center}&size=300x300&zoom=17"
    end

end
