class User < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :rentals, dependent: :destroy
  has_many :rents_as_owner, through: :products, source: :rentals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
