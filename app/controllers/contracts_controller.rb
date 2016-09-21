class ContractsController < ApplicationController
	before_action :set_contract, only: [:show, :edit, :update, :destroy]

   def index
    @contracts = Contract.all
  end

  def show
  end

  def new
    @contract = Contract.new
    render  :action => 'new'
  end

  def edit
  end

  def create
    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'contract was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

    def set_contract
      @contract = Contract.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      binding.pry
      params.require(:contract).permit( :name, :start_date, :end_date, :vendor_id, :customer_unit_price, :vendor_unit_price)
    end
end
