class Test < ApplicationRecord
  validates :stripeToken, presence: true, uniqueness: true
end
