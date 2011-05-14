require 'spree_core'
require 'spree_multi_outlet_hooks'

module SpreeMiltiTenancy
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      Store.rebuild!
    end
    config.to_prepare &method(:activate).to_proc
  end
end
    
SpreeBase::InstanceMethods.module_eval do
  def add_current_store_id_to_params
    params[:current_store_id] = current_store.outlets
  end
end
