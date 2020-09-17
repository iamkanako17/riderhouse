class LodgingsController < ApplicationController
  before_action :set_lodge, only: [:show]

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
  end

  private

  def lodge_params
    params.require(:lodging).permit(:lodge_name, :price, :postcode, :prefecture_id, :city, :block_number, :building, images: []).merge(host_user_id: current_host_user.id)
  end

  def set_lodge
    @lodge = Lodging.find(params[:id])
  end
end
