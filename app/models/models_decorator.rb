Product.class_eval do
  has_and_belongs_to_many :stores
  scope :by_store, lambda {|store| joins(:stores).where("products_stores.store_id IN (?)", store)}
end
Order.class_eval do
  scope :by_store, lambda { |store| where(:store_id => store.outlets) }
end