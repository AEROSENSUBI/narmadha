class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  autocomplete  :city, :area, :display_value => :area_with_city, :extra_data => [:area, :city, :taluk, :district, :state, :pin_code]

   def index
    @customers = Customer.all
  end

  def show
  end

  def new
    @customer = Customer.new
    render  :action => 'new'
  end

  def edit
  end

  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit( :name, :shop_name, :address_line_1, :address_line_2, :address_line_3, :area, :city, :taluk, :district, :state, :pin_code,
                                        :contact_number_1, :contact_number_2, :email, :website, :is_tailors, :is_upstair, :is_opposite_or_near, :is_back_side_of)
    end
end