class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        render 'users/my_portfolio'
      else
        flash[:danger] = "Ticker doesn't exist"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'You entered an empty the ticker'
      redirect_to my_portfolio_path
    end
  end
end
