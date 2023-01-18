class UserStocksController < ApplicationController

  def create
    stock = Stock.check_db(params[:stock])
    if stock.blank?
      stock = Stock.new_lookup(params[:stock])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} was succesfuly added to your portfolio"
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id)
    user_stock.destroy(user_stock.ids)
    flash[:notice] = "#{stock.ticker} was successfully removed from portfolio"
    redirect_to my_portfolio_path
  end
end
