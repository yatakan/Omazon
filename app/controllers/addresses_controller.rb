class AddressesController < ApplicationController
  before_action :authenticate_user!
  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to_index
    else
      render :new
    end
  end

  def edit
    set_address
  end

  def update
    set_address
    if @address.update(address_params)
      redirect_to_index
    else
      render :edit
    end
  end

  def destroy
    set_address
    @address.update(user_id: nil, destroy_at: Time.now)
    redirect_to_index
  end

  private
  def address_params
    params.require(:address).permit(:name, :tel, :address, :country, :post_cord, :prefecture, :company).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def redirect_to_index
    redirect_to addresses_path
  end
end
