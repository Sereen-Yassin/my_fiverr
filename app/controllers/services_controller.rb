class ServicesController < ApplicationController


  def index
    @service = Service.all
  end



  def show
    @service = Service.find(params[:id])
  end



  private
  def service_params
    params.require(:service).permit(:title, :description, :price, :category_id, :user_id, :user_name, :delivery_time, :included_revisions, :extra_delivery, :extra_delivery_price,
    :source_code_price, :revision_price, :revision_additional, :stock_image_price)
  end
end
