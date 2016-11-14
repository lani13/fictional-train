class CreateSpreeSuppliers < ActiveRecord::Migration
  def change
    create_table :spree_suppliers do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :nip
      t.string :regon

      t.timestamps null: false
    end
  end
end
