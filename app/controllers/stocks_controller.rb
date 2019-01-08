class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = "Ticker doesn't exist"
        redirect_to my_portfolio_path
      end
    else
      flash[:danger] = 'You entered an empty ticker'
      redirect_to my_portfolio_path
    end
  end
end
