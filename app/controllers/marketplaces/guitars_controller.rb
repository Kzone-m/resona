class Marketplaces::GuitarsController < ApplicationController
  def index
    target = "ギター"
    target_id = Instrument.find_by(name: target).id
    @guitars = SellItem.where(instrument_id: target_id)
  end
end
