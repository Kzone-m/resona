class MyPage::SellingItemsController < ApplicationController
  def index
    @sell_items = SellItem.all
  end
end
