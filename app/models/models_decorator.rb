Product.class_eval do
  has_and_belongs_to_many :stores
  scope :by_store, select('DISTINCT "products".*').joins(:master)
  
  def self.set_master outlets, store_id
    has_one :master,
      :class_name => 'Variant',
      :conditions => ['variants.is_master = ? AND variants.deleted_at IS NULL AND variants.store_id IN (?)', true, outlets],
      :order => ["(variants.store_id = #{store_id}) DESC, variants.price"]
  end

  has_many :parent_variants_including_master,
    :class_name => 'Variant',
    :conditions => ["variants.deleted_at IS NULL AND variants.parent_id IS NULL", true],
    :dependent => :destroy
    
#  has_many :variants_including_master,
#    :class_name => 'Variant',
#    :conditions => ["variants.deleted_at IS NULL AND variants.store_id IS NOT NULL"],
#    :dependent => :destroy
  
end
Order.class_eval do
  scope :by_store, lambda { |outlets| where(:store_id => outlets) }
  
end

