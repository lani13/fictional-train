class CreateSpreeTaxonomyTranslations < ActiveRecord::Migration
  def change
    create_table :spree_taxonomy_translations do |t|
      t.string :name
    end
  end
end
