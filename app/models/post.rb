class Post < ApplicationRecord

  belongs_to :customer
  has_one_attached :post_image

  validates :shop_name, presence: true, length: { maximum: 20 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :introduction, presence: true
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



  def self.search(keyword)
    where(["shop_name like? OR taste like?", "%#{keyword}%", "%#{keyword}%"])

  end

  #ラーメンスープの味で絞り込み
  def self.searchtaste(taste1)
  where(["taste like? OR address like?", "%#{taste1}%", "%#{taste1}%"])
  end

  def self.searchnoodle(noodle)
  where(["noodle_hardness like? OR address like?", "%#{noodle}%", "%#{noodle}%"])
  end

end
