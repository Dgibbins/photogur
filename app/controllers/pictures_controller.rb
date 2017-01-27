class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
    # render text: "Saving a picture. URL: #{params[:url]}, Title: #{params[:title]}, Artist: #{params[:artist]}"
  end

  def create
    # make a new picture using a private method picture_params. its a 'param sanitizer' which prevents people from messing with what values can be entered in as params.
    @picture = Picture.new(picture_params)
    if @picture.save
      #if save was successful, go to ....
      redirect_to pictures_url
    else
      #render the view associated with the action :new (new.html.erb)
      render :new
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])

    if @picture.update_attributes(picture_params)
      redirect_to "/pictures/#{@picture.id}"
    else
      render :edit
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_url
  end

  private
  def picture_params
    params.require(:picture).permit(:artist, :title, :url)
  end

end
