class RemoveSpreeTaxonomyTranslations < ActiveRecord::Migration
  def change
    drop_table :spree_taxonomy_translations
  end
end
