class Genre < ApplicationRecord
  has_many :anime_genres, dependent: :destroy
  has_many :animes, through: :anime_genres

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  scope :popular_order, -> { order(:name) }

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = name.to_s.parameterize if slug.blank?
  end
end
