class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  before_destroy do
    subcategories.destroy_all
  end
  belongs_to :parent_category, :class_name => "Category"
  has_many :services, dependent: :destroy
end
