Store.class_eval do
  acts_as_nested_set
  
  has_many :variants
  
  def outlets
    a = []
    self_and_descendants.each do |s|
      a << s.id
    end
    a
  end
  
end