class AddLocaleToSpreeTaxonomyTranslations < ActiveRecord::Migration
  def change
    add_column :spree_taxonomy_translations, :locale, :string
  end
end
