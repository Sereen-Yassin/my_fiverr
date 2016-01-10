class PagesController < ApplicationController

  def index
    @category = Category.where(:parent_id => 0)
  end

    def show_cart
      @cart = current_user.carts
    end

    def show_users
      @user = User.all
    end

    def delete_user
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end

    def delete_cart
      @cart = Cart.find(params[:id])
      @cart.destroy
      redirect_to root_path
    end

    def new_admin
      @user = User.new
      @user = User.find(params[:id]) unless params[:id].nil?
    end

    def create_admin
      @user = User.new(user_params)
      if @user.save
      redirect_to root_path
      end
    end

    private
    def user_params
      params.require(:new_admin).permit(:email, :password, :password_confirmation, :name, :user_type)
    end

end
