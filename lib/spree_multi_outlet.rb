require 'spree_core'
require 'spree_multi_outlet_hooks'

module SpreeMultiOutlet
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      #override search to make it multi-outlet aware
      Spree::Config.searcher_class = Spree::Search::MultiOutlet
      
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end
    config.to_prepare &method(:activate).to_proc
  end
end
    
SpreeBase::InstanceMethods.module_eval do
  
  def current_store
    @current_store ||= cached_store.store
  end
  
  def current_tracker
    @current_tracker ||= cached_store.tracker
  end
  
  def add_current_store_id_to_params
    params[:current_outlets] ||= cached_store.outlets
    params[:current_store_id] ||= current_store.id
    Product.set_master params[:current_outlets], params[:current_store_id]
  end
  
  def cached_store
    return @cached if !@cached.nil?
    
    cache = "cached_store_from_#{request.env['SERVER_NAME']}"
    
    @cached = Rails.cache.read(cache)
    return @cached if !@cached.nil?
    
    store ||= ::Store.current(request.env['SERVER_NAME'])
    tracker ||= Tracker.current(request.env['SERVER_NAME'])
    
    @cached = CachedDomainStore.new
    
    @cached.domains = store.domains
    @cached.store = store
    @cached.outlets = store.outlets
    @cached.tracker = tracker
    
    Rails.cache.write(cache, @cached)
    
    @cached
  end
  
end

class CachedDomainStore
  attr_accessor :domains, :store, :outlets, :tracker
end
