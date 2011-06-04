class Admin::StorePricesController < Admin::BaseController

  def index
    
    @product = Product.find_by_permalink(params[:product_id])
    
    @store_prices = Variant.where('product_id = ? AND parent_id IS NOT NULL', @product.id).includes(:store)
    @store_price = Variant.new
  end

  def create
    info = params[:store_price]
    parent = Variant.find(info[:parent_id])
    v = Variant.find_or_create_by_store_id_and_parent_id_and_product_id(info)
    v.price = info[:price]
    v.is_master = parent.is_master
    v.on_hand = info[:on_hand]
    v.save
    index
    render 'index'
  end

  def update
    Variant.update(params[:store_price][:id], params[:store_price])
    index
    render 'index'
  end

  # DELETE /store_prices/1
  # DELETE /store_prices/1.xml
  def destroy
    @store_price = Variant.find(params[:id])
    @store_price.destroy

  end
end
