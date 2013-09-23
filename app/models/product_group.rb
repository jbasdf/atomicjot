class ProductGroup < ActiveRecord::Base
  has_many :product_connections
  has_many :products, :through => :product_connections
end
