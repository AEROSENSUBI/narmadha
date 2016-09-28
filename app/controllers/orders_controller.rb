class OrdersController < ApplicationController
	before_action :set_order, only: [:show, :edit, :update, :destroy]
  autocomplete  :customer, :shop_name, :display_value => :shop_name_with_city, :extra_data => [:city]

   def index
    @orders = Order.all
  end

  def show
  end

  def new
    if params[:customer_id].present?
      @order = Order.new(:customer_id => params[:customer_id].to_i)
    else
      @order = Order.new
    end
    @order.order_products.build
    render  :action => 'new'
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'order was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def delete_order_product
    @order_product = @order.order_products.find(params[:order_order_product_id])
    respond_to do |format|
      if @order_product.destroy
        format.html { redirect_to edit_order_path(@order) }
        format.js
      else
        flash[:error] = "Failed to delete consignment content."
        format.html { redirect_to edit_order_path(@order) }
        format.js { js_redirect_to(edit_order_path(@order)) }
      end
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      binding.pry
      params.require(:order).permit(:customer_id, :vendor_id, :booking_at, :ready_for_production_at, :dispatch_at, :delivery_at, 
                                    order_products_attributes: [:id, :vendor_id, :product_id, :units, :expected_delivery_date, :notes, :_destroy, :order_id, :avatar])
    end
end
