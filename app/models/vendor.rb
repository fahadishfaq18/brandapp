class Vendor < ApplicationRecord
	belongs_to :shop
	has_one_attached :logo
end
