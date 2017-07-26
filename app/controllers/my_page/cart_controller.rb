class MyPage::CartController < ApplicationController
  def index
    @carts = []
    User.first.carts.each do |cart|
      @carts.append(SellItem.find_by(id: cart.sell_item_id))
    end
  end

  def create
    cart = Cart.new(user_id: User.first.id, sell_item_id: params[:sell_item_id])
    if cart.save
      redirect_to my_page_cart_index_url
    else
      redirect_to my_page_cart_index_url
    end
  end

  def destroy
    User.first.carts.find_by(sell_item_id: params[:id]).destroy
    redirect_to my_page_cart_index_url
  end

  #private
  #def cart_params
  #  params.require(:sell_item).permit(:sell_item_id,)
  #end
end
