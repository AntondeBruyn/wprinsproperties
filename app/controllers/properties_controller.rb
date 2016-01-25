class PropertiesController < ApplicationController
  def index
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)

    if@property.save
      flash[:notice] = "Property has been created."
      redirect_to @property
    else
      #nothing, yet
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  private

  def property_params
    params.require(:property).permit(:name, :description)
  end
end
