class Marketplaces::BassesController < ApplicationController
  def index
    target = "ベース"
    target_id = Instrument.find_by(name: target).id
    @basses = SellItem.where(instrument_id: target_id)
  end
end
