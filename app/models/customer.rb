class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  has_one_attached :profile_image

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true



  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
