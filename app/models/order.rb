class Order < ApplicationRecord
	belongs_to :product
end

class product < ApplicationRecord
	has_many :orders
end