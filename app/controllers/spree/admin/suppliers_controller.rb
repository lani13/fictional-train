module Spree
 module Admin
   class SuppliersController < ResourceController

     def index
		@collection = Spree::Supplier.all
	  end


   end
  end
end
