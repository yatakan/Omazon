class AddressesController < ApplicationController

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    Address.create(address_params)
    redirect_to_index
  end

  def edit
    find_address
  end

  def update
    find_address
    @address.update(address_params)
    redirect_to_index
  end

  def destroy
    find_address
    @address.destroy
    redirect_to_index
  end

  private
  def address_params
    params.require(:address).permit(:name, :tel, :address).merge(user_id: current_user.id)
  end

  def find_address
    @address = Address.find(params[:id])
  end

  def redirect_to_index
    redirect_to addresses_path
  end
end
