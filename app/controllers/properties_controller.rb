class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

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

  def destroy
    @property = Property.find(params[:id])
    @property.destroy

    flash[:notice] = "Property has been deleted."

    redirect_to properties_path
  end

  private

  def set_property
    @property = Property.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "The property you were looking" +
                      " for could not be found."

      redirect_to properties_path
  end

  def property_params
    params.require(:property).permit(:name, :description, :price, :location)
  end
end
