Spree::Admin::ProductsController.class_eval do
    
   before_action :load_suppliers, only: :edit


	def load_suppliers
	   @suppliers = Spree::Supplier.order(:name)
	end


end