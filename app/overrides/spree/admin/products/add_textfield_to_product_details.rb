Deface::Override.new(
  virtual_path: 'spree/admin/products/_form',
  name:         'supplier_field',
  insert_bottom: '[data-hook="admin_product_form_tax_category"]',
  partial:      'spree/admin/products/supplier_field'
)
