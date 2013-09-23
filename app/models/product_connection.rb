class ProductConnection < ActiveRecord::Base
  belongs_to :product_group
  belongs_to :product
end
