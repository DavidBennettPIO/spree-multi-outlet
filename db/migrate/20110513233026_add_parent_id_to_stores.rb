class AddParentIdToStores < ActiveRecord::Migration
  def self.up
    change_table :stores do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
    end
  end

  def self.down
    change_table :stores do |t|
      t.remove :parent_id
      t.remove :lft
      t.remove :rgt
    end
  end
end