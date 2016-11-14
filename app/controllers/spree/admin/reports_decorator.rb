Spree::Admin::ReportsController.class_eval do

  def initialize
    super 
    Spree::Admin::ReportsController.add_available_report!(:sales_total)
    Spree::Admin::ReportsController.add_available_report!(:order_costs)    
  end  
  
  def order_costs
    params[:q] = {} unless params[:q]

    if params[:q][:completed_at_gt].blank?
      params[:q][:completed_at_gt] = Time.zone.now.beginning_of_month
    else
      params[:q][:completed_at_gt] = Time.zone.parse(params[:q][:completed_at_gt]).beginning_of_day rescue Time.zone.now.beginning_of_month
    end

    if params[:q] && !params[:q][:completed_at_lt].blank?
      params[:q][:completed_at_lt] = Time.zone.parse(params[:q][:completed_at_lt]).end_of_day rescue ""
    end

    params[:q][:s] ||= "completed_at desc"

    @search = Spree::Order.complete.ransack(params[:q])
    @orders = @search.result

    @totals = {}
    @orders.each do |order|
      
      @totals[order.currency] = { :order_costs => 0, :tax_amount => ::Money.new(0, order.currency), :sales_total => ::Money.new(0, order.currency) } unless @totals[order.currency]
      
      sum = 0.0
      
      order.line_items.each do |item|
         sum += item.variant.cost_price.to_f * item.quantity
      end
      
      
      
      @totals[order.currency][:order_costs] += sum
      @totals[order.currency][:tax_amount] += order.display_tax_total.money
      @totals[order.currency][:sales_total] += order.display_total.money
    end

  end
end
