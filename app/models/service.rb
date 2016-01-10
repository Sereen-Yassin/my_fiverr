class Service < ActiveRecord::Base
  belongs_to :category
  has_many :carts, dependent: :destroy
end
