class MoneyTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: %i[show edit update destroy]
  before_action :init_dates, only: %i[all_transactions index]

  def all_transactions
    @user = current_user
    @transactions = MoneyTransaction.where(user: @user).order('created_at DESC').includes(:categories)
    @categories = Category.where(user: @user)
    set_totals
    set_dates
  end

  def index
    @user = current_user
    @categories = Category.where(user: @user)
    @category = Category.find(params[:category_id])

    @transactions = @category.money_transactions

    @total = @category.total
    @incomes = @category.incomes
    @expenses = @category.expenses

    set_dates
  end

  # GET /transactions/1 or /transactions/1.json
  def show
    @title = 'Detail of a transaction'
  end

  # GET /transactions/new
  def new
    @user = current_user
    @transaction = MoneyTransaction.new
    @categories = Category.where(user: @user)
  end

  # GET /transactions/1/edit
  def edit
    @title = 'Edit a transaction'
  end

  # POST /transactions or /transactions.json
  def create
    @transaction = MoneyTransaction.new(transaction_params)
    @transaction.user = current_user
    selected_categories = params[:selected_categories]    

    respond_to do |format|
      if selected_categories
        if @transaction.save
          selected_categories.values.each do |selected_category|
            category = Category.find(selected_category[:id])

            CategoriesTransaction.create(
              money_transaction_id: @transaction.id,
              category_id: category.id
            )
          end

          format.html { redirect_to money_transactions_path, notice: 'transaction was successfully created.' }
        else
          format.html { redirect_to new_money_transaction_path, alert: 'Error: transaction could not be created.' }
        end
      else
        format.html { redirect_to new_money_transaction_path, alert: 'Error: transaction could not be created. Please, select at least one category!' }
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
    params.require(:money_transaction).permit(:name, :price, :its_type)
  end

  def set_totals
    @incomes = 0
    @expenses = 0

    @transactions.each do |transaction|
      @incomes += transaction.price if transaction.its_type == "income"
      @expenses += transaction.price if transaction.its_type == "expense"
    end

    @total = @incomes - @expenses
  end
  
  def init_dates
    @first_transaction_date = nil
    @last_transaction_date = nil
    @last_income_date = nil
    @last_expense_date = nil
  end

  def set_dates
    unless @transactions.empty? 
      incomes = @transactions.where(its_type: "income").order('created_at DESC')
      expenses = @transactions.where(its_type: "expense").order('created_at DESC')
      @first_transaction_date = @transactions.last.created_at
      @last_transaction_date = @transactions.first.created_at

      @last_income_date = incomes.first.created_at unless incomes.empty?
      @last_expense_date = expenses.first.created_at unless expenses.empty?
    end
  end
end
