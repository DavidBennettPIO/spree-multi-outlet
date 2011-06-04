Variant.class_eval do
  
  belongs_to :store
  
  belongs_to :parent,
    :class_name => 'Variant',
    :foreign_key => 'parent_id',
    :conditions => ["variants.deleted_at IS NULL AND variants.parent_id IS NULL"]
    
    
  def current_outlets
    [1,2]
  end
    
  def variant_name
    self.is_master ? 'master' : options_text
  end    
    
  def sku
    if !self.parent_id.nil?
      self.parent.sku
    else
      super
    end
  end
  def sku=(value)
    if self.parent_id.nil?
      super(value)
    end
  end
  
  def weight
    if !self.parent_id.nil?
      self.parent.weight
    else
      super
    end
  end
  def weight=(value)
    if self.parent_id.nil?
      super(value)
    end
  end
  
  def height
    if !self.parent_id.nil?
      self.parent.height
    else
      super
    end
  end
  def height=(value)
    if self.parent_id.nil?
      super(value)
    end
  end
  
  def width
    if !self.parent_id.nil?
      self.parent.width
    else
      super
    end
  end
  def width=(value)
    if self.parent_id.nil?
      super(value)
    end
  end
  
  def depth
    if !self.parent_id.nil?
      self.parent.depth
    else
      super
    end
  end
  def depth=(value)
    if self.parent_id.nil?
      super(value)
    end
  end
  
  if Variant.table_exists? && Variant.column_names.include?("cost_price")
    def cost_price
      if !self.parent_id.nil?
        #self.parent.cost_price
      else
        super
      end
    end
    def cost_price=(value)
      if self.parent_id.nil?
        super(value)
      end
    end
  end
  
end