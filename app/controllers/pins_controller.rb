class PinsController < ApplicationController
  # resources :pins

  def new
   
    @pin = Pin.new
  end

  def index 
    @pin = Pin.all
    resopnd_to do |f|
      f.html {render :index}
      j.json { render :json => @pins, only: [:id, :latitude, :longitude, :http_response]}
    end
  end

  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.json { render json: @pin, status: :created}
      else
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end
  

  private
  def pin_params
    params.require(:pin).permit(:latitude, :longitude)
  end



end
