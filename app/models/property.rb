class Property < ActiveRecord::Base
  validates :name, presence: true
  has_many :galleries, dependent: :delete_all
end
