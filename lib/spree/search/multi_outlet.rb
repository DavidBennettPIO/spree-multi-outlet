module Spree::Search
  class MultiOutlet < Spree::Search::Base
    def get_base_scope
      
      base_scope = @cached_product_group ? @cached_product_group.products.active : Product.active
      
      base_scope = base_scope.by_store
      base_scope = base_scope.in_taxon(taxon) unless taxon.blank?
      
      
      base_scope = get_products_conditions_for(base_scope, keywords) unless keywords.blank?

      base_scope = base_scope.on_hand unless Spree::Config[:show_zero_stock_products]
      base_scope
    end
    
    def prepare(params)
      super
      @properties[:current_outlets] = params[:current_outlets]
      @properties[:current_store_id] = params[:current_store_id]
    end
  end
end