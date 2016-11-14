Spree::ProductsController.class_eval do
    
   before_action :load_supplier, only: :show


	def load_supplier 
	   @supplier = Spree::Supplier.find(@product.supplier_id)
	end


end