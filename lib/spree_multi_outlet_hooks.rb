class SpreeMultiOutletHooks < Spree::ThemeSupport::HookListener

  
  Deface::Override.new(:virtual_path => "admin/shared/_product_tabs",
                     :name => "converted_admin_product_tabs_421226616",
                     :insert_bottom => "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     :text =>
                      "<li<%== ' class=\"active\"' if current == \"Taxons\" %>>
                        <%= link_to t('store_prices'), admin_product_store_prices_path(@product) %>
                      </li>",
                     :disabled => false)
end