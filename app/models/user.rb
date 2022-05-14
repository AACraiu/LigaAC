class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  
  has_many :posts, dependent: :destroy

  has_secure_password
end
