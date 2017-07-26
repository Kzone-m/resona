class SellItemsController < ApplicationController
  def index
    @sell_items = SellItem.all
    # binding.pry
  end

  def show
    @sell_item = SellItem.find_by(id: params[:id])
  end

  def new
    gon.categories = {}
    Category.all.each do |c|
      if !gon.categories.has_key?(c.instrument_id)
        gon.categories[c.instrument_id] = {}
        gon.categories[c.instrument_id][c.id] = c.name
      else
        gon.categories[c.instrument_id][c.id] = c.name
      end
    end

    gon.models = {}
    ProductModel.all.each do |p|
      if !gon.models.has_key?(p.instrument_id)
        gon.models[p.instrument_id] = {}
        if gon.models[p.instrument_id].empty?
          gon.models[p.instrument_id][p.brand_id] = {}
          gon.models[p.instrument_id][p.brand_id][p.id] = p.name
        else
          if !gon.models[p.instrument_id][p.brand_id].has_key?(p.id)
            gon.models[p.instrument_id][p.brand_id][p.id] = p.name
          else
            gon.models[p.instrument_id][p.brand_id][p.id] = p.name
          end
        end
      else
        if !gon.models[p.instrument_id].has_key?(p.brand_id)
          gon.models[p.instrument_id][p.brand_id] = {}
          gon.models[p.instrument_id][p.brand_id][p.id] = p.name
        else
          gon.models[p.instrument_id][p.brand_id][p.id] = p.name
        end
      end
    end
    @sell_item = User.first.sell_items.build
    @sell_item.images.build
  end

  def create
    # @sell_item = current_user.sell_items.build
    @sell_item = User.first.sell_items.build(sell_item_params)
    if @sell_item.save
      # redirect_to new_sell_item_url
      redirect_to sell_items_url
    else
      # render "new"
      render new_sell_item_path
    end
  end

  def edit
  end

  private
  def sell_item_params
    params.require(:sell_item).permit(
        :instrument_id,
        :category_id,
        :brand_id,
        :product_model_id,
        :condition_id,
        :name,
        :price,
        :listing_title,
        images_attributes: [:id, :picture, :_destroy]
    )
  end


  # def get_categories
  #  @categories = Category.where(instrument_id: params[:category_id])
  #  respond_to do |format|
  #    format.js
  #  end
  #   @sell_item = User.first.sell_items.build
  #   render partial: 'select_category', locals: {instrument_id: params[:instrument_id]}
  # end

  # def get_product_models
  #  render partial: 'select_city', locals: {prefecture_id: params[:prefecture_id]}
  # end

  # images_attributes
end
