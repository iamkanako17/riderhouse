class LodgingsController < ApplicationController
  before_action :set_lodge, only: [:show, :edit, :destroy]

  def index
    @lodges = Lodging.all.order('created_at DESC')
  end

  def new
    @lodge = Lodging.new
  end

  def create
    @lodge = Lodging.new(lodge_params)
    if @lodge.valid?
      @lodge.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @lat = @lodge.latitude
    @lng = @lodge.longitude
  end

  def edit
  end

  def update
    lodge = Lodging.find(lodge_params)
    if lodge.valid?
      lodge.update(lodge_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @lodge.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def lodge_params
    params.require(:lodging).permit(:lodge_name, :price, :postcode, :prefecture_city, :latitude, :longitude, :block_number, :building, :description, images: []).merge(host_user_id: current_host_user.id)

  end

  def set_lodge
    @lodge = Lodging.find(params[:id])
  end
end
