class AddressesController < ApplicationController

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
    find_address
  end

  def update
    find_address
    if @address.update(address_params)
      redirect_to_index
    else
      render :edit
    end
  end

  def destroy
    find_address
    @address.update(user_id: nil, destroy_at: Time.now)
    redirect_to_index
  end

  private
  def address_params
    params.require(:address).permit(:name, :tel, :address, :country, :post_cord, :prefecture, :company).merge(user_id: current_user.id)
  end

  def find_address
    @address = Address.find(params[:id])
  end

  def redirect_to_index
    redirect_to addresses_path
  end
end
