Admin::BaseController.class_eval do
  
  before_filter :use_base_variant
  
  def use_base_variant
    Product.class_eval do
      has_one :master,
        :class_name => 'Variant',
        :conditions => ["variants.is_master = ? AND variants.deleted_at IS NULL AND variants.parent_id IS NULL", true]
    end
  end
  
end