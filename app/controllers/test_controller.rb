class TestController < ActionController::Base
  def index
    @accounts = Account.all
  end
end
