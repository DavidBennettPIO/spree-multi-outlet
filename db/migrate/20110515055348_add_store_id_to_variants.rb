class AddStoreIdToVariants < ActiveRecord::Migration
  def self.up
    change_table :variants do |t|
      t.integer :parent_id
      t.integer :store_id
    end
  end

  def self.down
    change_table :variants do |t|
      t.remove :parent_id
      t.remove :store_id
    end
  end
end
