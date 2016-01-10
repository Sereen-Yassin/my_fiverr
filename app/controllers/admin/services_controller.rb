class Admin::ServicesController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy, :new, :update]

    def index
      @service = Service.all
    end

    def new
      @service = Service.new
    end

    def create
      @service = Service.new(service_params)
      if @service.save
        redirect_to @service
      else
        render 'new'
      end
    end

    def show
      @service = Service.find(params[:id])
    end

    def edit
      @service = Service.find(params[:id])
    end

    def update
      @service = Service.find(params[:id])
      if @service.update(service_params)
        redirect_to @service
      else
        render 'edit'
      end
    end


    def destroy
      @service = Service.find(params[:id])
      @service.destroy
     redirect_to root_path
    end

    private
    def service_params
      params.require(:service).permit(:title, :description, :price, :category_id, :user_id, :user_name, :delivery_time, :included_revisions, :extra_delivery, :extra_delivery_price,
      :source_code_price, :revision_price, :revision_additional, :stock_image_price)
    end
end
