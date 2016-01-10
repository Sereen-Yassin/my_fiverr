class Admin::CategoriesController < ApplicationController
    def index
      #@category = nil
      @category = Category.find(:all , :conditions => {:parent_id => 0})
    end

    def new
      @category = Category.new
      @category.parent = Category.find(params[:id]) unless params[:id].nil?
    end

    def create
      @category = Category.new(category_params)
      if @category.save
      redirect_to @category
      else
      render 'new'
      end
    end

    def show
      # Find the category belonging to the given id
    @category = Category.find(params[:id])
    # Grab all sub-categories
    @categories = @category.subcategories
    # We want to reuse the index renderer:
    render :action => :index
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to root_path
      #@category.parent = Category.find(params[:id])  unless params[:id].nil?
      #@subcategories = @category.subcategories.find(params[:id])
      #@subcategories.destroy
      #redirect_to category_path(@category)
    end

    def edit
    @category = Category.find(params[:id])
    end

    def update
      @category = Category.find(params[:id])
      if @category.update(category_params)
        redirect_to @category
      else
        render 'edit'
      end
    end

    private
    def category_params
      params.require(:category).permit(:name, :parent_id)
    end
end
