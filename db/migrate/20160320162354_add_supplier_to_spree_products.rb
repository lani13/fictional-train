class AddSupplierToSpreeProducts < ActiveRecord::Migration
  def change
    add_reference :spree_products, :supplier, index: true, foreign_key: true
  end
end
