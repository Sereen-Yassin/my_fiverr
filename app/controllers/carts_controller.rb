class CartsController < ApplicationController

  def index
    #@user = User.find(params[:current_user])
    @service = Service.find(params[:service_id])
    @cart = Cart.all
  end

  def create
    @service = Service.find(params[:service_id])
    @cart = @service.carts.create(cart_params)
    redirect_to service_path(@service)
  end

  private
    def cart_params
      params.require(:cart).permit(:user_id, :service_id, :service_owner, :owner_name, :service_name)
    end
end
