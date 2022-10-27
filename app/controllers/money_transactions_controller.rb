class MoneyTransactionsController < ApplicationController
  before_action :set_transaction, only: %i[show edit update destroy]

  # GET /transactions or /transactions.json
  def index
    @title = 'List of transactions'
    @transactions = MoneyTransaction.all
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @title = 'Detail of a transaction'
  end

  # GET /transactions/new
  def new
    @title = 'Create a transaction'
    @transaction = MoneyTransaction.new
  end

  # GET /transactions/1/edit
  def edit
    @title = 'Edit a transaction'
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = MoneyTransaction.new(transaction_params)
    @transaction.user = current_user

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to transaction_url(@transaction), notice: 'transaction was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1 or /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to transaction_url(@transaction), notice: 'transaction was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1 or /transactions/1.json
  def destroy
    @transaction.destroy

    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'transaction was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = MoneyTransaction.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def transaction_params
    params.require(:money_transaction).permit(:name, :price, :type)
  end
end
