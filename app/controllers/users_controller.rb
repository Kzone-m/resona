class UsersController < ApplicationController
  def index
    @sell_items = SellItem.all # take(20)
  end
end
