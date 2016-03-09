class Gallery < ActiveRecord::Base
  belongs_to :property
  validates :name, presence: true
  has_many :photos, dependent: :delete_all
end
