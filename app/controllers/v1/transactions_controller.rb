require 'net/http'

class V1::TransactionsController < ApplicationController
  def index
    transactions = Transaction.all
    transactions = transactions.where('created_at > ?', params[:start_date]) if params[:start_date]
    transactions = transactions.where('created_at < ?', params[:end_date]) if params[:end_date]
    render json: transactions
  end

  def transfer   
    transaction = Transaction.create!(
      amount: amount, 
      account_from_id: params[:account_from_id], 
      account_to_id: params[:account_to_id],
      description: params[:description]
    )

    if transaction.save 
      render json: { status: 200, message: 'Transaction completed' }
    else 
      render json: { status: 500, message: 'Transaction failed' }
    end
  end

  private 

  def amount 
    accounts_by_id = Account.all.pluck(:id, :currency).group_by(&:first)
    account_from_currency = accounts_by_id[params[:account_from_id].to_i].flatten.last
    account_to_currency = accounts_by_id[params[:account_to_id].to_i].flatten.last
    
    if account_from_currency != account_to_currency
      convert(params[:amount], account_from_currency, account_to_currency)
    else 
      params[:amount]
    end
  end

  def convert(from_amount, from_currency, to_currency)
    from_value = current_exchange_rates[from_currency].to_f
    to_value   = current_exchange_rates[to_currency].to_f

    base_from_value = from_amount.to_f / from_value 
    from_value_converted = base_from_value * to_value
  end
  
  def current_exchange_rates
    @current_exchange_rates || fixer_current_exchange_rates  
  end 
  
  def fixer_current_exchange_rates
    uri = URI.parse('http://data.fixer.io/api/latest?access_key=10467ebc20d0e59a0bb2028a6220784a')
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.get(uri)
    @current_exchange_rates = JSON.parse(response.body)['rates']
  end
end