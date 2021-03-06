require 'role_model'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  include RoleModel
  #attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :roles_mask
  roles_attribute :roles_mask
  roles :admin, :user, :guest
  def send_devise_notification(notification, *args)
  devise_mailer.send(notification, self, *args).deliver_later
  end
  has_many :carts
end
