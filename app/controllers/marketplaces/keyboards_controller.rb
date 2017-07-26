class Marketplaces::KeyboardsController < ApplicationController
  def index
    target = "キーボード"
    target_id = Instrument.find_by(name: target).id
    @keyboards = SellItem.where(instrument_id: target_id)
  end
end
