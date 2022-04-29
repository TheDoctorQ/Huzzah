class Image < ApplicationRecord
  belongs_to :vendor
  belongs_to :feast
  belongs_to :event
end
