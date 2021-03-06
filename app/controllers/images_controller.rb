class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

  def create
    puts params[:property]
    @property_id = Property.find(params[:property])
    @image = Image.new(image: params[:image], property: @property_id)
    # @image.property = Property.first
    if @image.save
      redirect_to "/properties"
    else
      redirect_to "/properties/new"
    end
  end

  # private
  # def image_params
  #   params.require(:image).permit(:image)
  # end
end
