class GalleriesController < ApplicationController
  before_action :set_property
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  def new
    @gallery = @property.galleries.build
  end

  def create
    @gallery = @property.galleries.build(gallery_params)

    if @gallery.save
      flash[:notice] = "Gallery has been created."
      redirect_to [@property, @gallery]
    else
      flash.now[:alert] = "Gallery has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @gallery.update(gallery_params)
      flash[:notice] = "Gallery has been updated."
      redirect_to [@property, @gallery]
    else
      flash.now[:alert] = "Gallery has not been updated."
      render "edit"
    end
  end

  def destroy
    @gallery.destroy
    flash[:notice] = "Gallery has been deleted."

    redirect_to @property
  end

private

  def set_property
    @property = Property.find(params[:property_id])
  end

  def set_gallery
    @gallery = @property.galleries.find(params[:id])
  end

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
 
