class Post < ApplicationRecord

  belongs_to :customer
  has_one_attached :post_image

  validates :shop_name, presence: true, { maximum: 30 }
  validates :address, presence: true
  validates :introduction, presence: true, { maximum: 100 }
  validates :taste, presence: true
  validates :noodle_hardness, presence: true
  validates :evaluation, presence: true
  validates :post_image, presence: true, blob: { content_type: :image }

  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_customers, through: :favorites, source: :customer

  #緯度算出
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

private


　#ラーメン店名検索
  def self.search(keyword)
    where(["shop_name like? OR taste like?", "%#{keyword}%", "%#{keyword}%"])

  end

  def self.searchtaste(taste1)
  where(["taste like? OR address like?", "%#{taste1}%", "%#{taste1}%"])
  end

  def self.searchnoodle(noodle)
  where(["noodle_hardness like? OR address like?", "%#{noodle}%", "%#{noodle}%"])
  end

end
