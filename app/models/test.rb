class Test < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
