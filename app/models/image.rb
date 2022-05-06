class Image < ApplicationRecord
  # belongs_to :vendor
  # belongs_to :feast
  # belongs_to :event
  has_many :events
  has_many :vendors
  has_many :feasts
end
