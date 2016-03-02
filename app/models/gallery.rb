class Gallery < ActiveRecord::Base
  belongs_to :property
  validates :name, presence: true
end
