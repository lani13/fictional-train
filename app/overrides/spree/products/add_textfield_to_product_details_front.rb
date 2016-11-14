Deface::Override.new(
  virtual_path: 'spree/products/show',
  name:         'supplier_field_front',
  insert_bottom: '[data-hook="product_description"]',
  partial:      'spree/products/supplier_field'
)
