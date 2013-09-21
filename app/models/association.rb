class Association < ActiveRecord::Base
  belongs_to :user, :inverse_of => :associations
  belongs_to :merchant, :inverse_of => :associations
end