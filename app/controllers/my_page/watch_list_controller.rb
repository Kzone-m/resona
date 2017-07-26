class MyPage::WatchListController < ApplicationController
  def index
    @sell_items = SellItem.all
  end
end
