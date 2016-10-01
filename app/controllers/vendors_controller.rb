class VendorsController < ApplicationController
	before_action :set_vendor, only: [:show, :edit, :update, :destroy, :send_orders]

   def index
    @vendors = Vendor.all
  end

  def show
  end

  def new
    @vendor = Vendor.new
    render  :action => 'new'
  end

  def edit
  end

  def create
    @vendor = Vendor.new(vendor_params)

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor }
      else
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @vendor.update(vendor_params)
        format.html { redirect_to @vendor, notice: 'vendor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendor }
      else
        format.html { render :edit }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vendor.destroy
    respond_to do |format|
      format.html { redirect_to vendors_url, notice: 'vendor was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def send_orders
    @order_products = @vendor.order_products
    respond_to do |format|
      format.html
      format.pdf do
        #render pdf: "sample"
        pdf1 = WickedPdf.new.pdf_from_string(render_to_string('vendors/send_orders.pdf.erb', layout: 'layouts/pdf.html.erb'))
        send_data pdf1, :filename => "#{@vendor.company_name}_#{Date.today}.pdf", :type => "application/pdf", :disposition => "attachment"
      end
    end
  end

  private

    def set_vendor
      @vendor = Vendor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendor_params
      params.require(:vendor).permit( :name, :company_name, :address_line_1, :address_line_2, :address_line_3, :city, :taluk, :district, :state, :pin_code,
                                      :contact_number_1, :contact_number_2, :email, :website)
    end
end
