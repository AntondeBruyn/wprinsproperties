class PropertiesController < ApplicationController
  def index
    @properties = Property.all
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
      flash.now[:alert] = "Property has not been created."
      render "new"
    end
  end

  def show
    @property = Property.find(params[:id])
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])

    if @property.update(property_params)
      flash[:notice] = "Property has been updated."
      redirect_to @property
    else
      flash.now[:alert] = "Property has not been updated."
      render "edit"
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :description)
  end
end
