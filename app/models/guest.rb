class Guest < ApplicationRecord
  validates :name, length: { minimum: 2 }

  belongs_to :admin
end
