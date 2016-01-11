class CategoriesController < ApplicationController

  def index
    #@category = nil
    @category = Category.where(:parent_id => 0)
  end



  def show
    # Find the category belonging to the given id
  @category = Category.find(params[:id])
  # Grab all sub-categories
  @categories = @category.subcategories
  # We want to reuse the index renderer:
  render :action => :index
  end





  private
  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
