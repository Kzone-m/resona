# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: "HIGE", email: "hige@gmail.com")
User.create(name: "SODA", email: "soda@gmail.com")

conditions = ["新品", "ほぼ新品", "中古"]
conditions.each do | condition |
  Condition.create(name: condition)
end

brands = ["ギブソン", "フェンダー", "リッケンバッカー"]
brands.each do | brand |
  Brand.create(name: brand)
end

instruments = [
  ["ベース", ["4弦", "多弦", "フレットレス"]],
  ["ギター", ["ソリットボディ", "ホローボディ", "多弦"]],
  ["キーボード", ["オルガン", "シンセサイザー", "エレクトリックピアノ"]]
]
instruments.each do | instrument |
  i = Instrument.create(name: instrument[0])
  instrument[1].each do | category |
    Category.create(instrument_id: i.id, name: category)
  end
end

fender = Brand.find_by(name: "フェンダー")
fender_product_models = [
  ["ベース", ["ジャズ", "プレシジョン", "ジャガー"]],
  ["ギター", ["ストラト", "テレキャス", "ジャガー"]],
  ["キーボード", ["ローズ"]]
]
fender_product_models.each do | instrument |
  instrument_name = instrument[0]
  instrument_models = instrument[1]
  inst = Instrument.find_by(name: instrument_name)
  instrument_models.each do | model_name |
    ProductModel.create(instrument_id: inst.id, brand_id: fender.id, name: model_name)
  end
end
=begin
=end
