class User < ApplicationRecord
  validates :token, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

end
