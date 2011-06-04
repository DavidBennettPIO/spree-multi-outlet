class StorePrice < ActiveRecord::Base
  belongs_to :store
  has_many :variants
end
