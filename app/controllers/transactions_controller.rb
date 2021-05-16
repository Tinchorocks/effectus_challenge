class TransactionsController < ActionController::Base
  def index
    transactions = Transaction.all
    transactions = transactions.where('created_at > ?', params[:start_date]) if params[:start_date]
    transactions = transactions.where('created_at < ?', params[:end_date]) if params[:end_date]
    render json: { transactions.to_h }
  end

  def transfer 
    account_from = Account.find(params[:account_from_id])
    account_to   = Account.find(params[:account_to_id])
    
    if account_from.currency != account_to.currency
      amount = convert(amount, account_from.currency, account_to.currency)
    end
      
    transaction = Transaction.create!(amount: amount, account_from: account_from, account_to: account_to)

    if transaction.save 
      render json: { status: 'ok' }
    else 
      render json: { status: 'error' }
    end
  end

  private 

  def convert(amount, from, to)
    # converts amount from currency A to currency B
     params = { 
      access_key: '10467ebc20d0e59a0bb2028a6220784a',
      from: from,
      to: to,
      amount: amount 
    }

    # POST http://data.fixer.io/api/convert -> params

    # return amount
  end
end
