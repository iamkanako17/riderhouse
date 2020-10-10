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
    gon.lodge = @lodge
  end

  def edit
  end

  def update
    lodge = Lodging.find(params[:id])
    if lodge.valid?
      lodge.update(lodge_params)
      redirect_to lodging_path(lodge.id)
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

  def search
    @lodges = Lodging.search(params[:keyword])
  end

  private

  def lodge_params
    params.require(:lodging).permit(:lodge_name, :price, :postcode, :prefecture_city, :latitude, :longitude, :block_number, :building, :description, images: []).merge(host_user_id: current_host_user.id)

  end

  def set_lodge
    @lodge = Lodging.find(params[:id])
  end
end
