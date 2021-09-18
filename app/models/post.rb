class Post < ApplicationRecord

  belongs_to :customer

  has_one_attached :post_image
  validate :post_image_type

  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :favorited_customers, through: :favorites, source: :customer

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

private

  def post_image_type
    if !post_image.blob.content_type.in?(%('post_image/jpg post_image/png post_image/jpeg'))
      post_image.purge # Rails6では、この1行は必要ない
      errors.add(:post_image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
    end
  end

  def self.search(keyword)
    where(["shop_name like? OR taste like?", "%#{keyword}%", "%#{keyword}%"])
  end




end
