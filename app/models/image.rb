class Image < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :sell_item
  validate :picture_size

  private
    def picture_size
      if picture.size > 5.megabytes
        erros.add(:picture, "5メガバイト以下のファイルを送信してください")
      end
    end
end
