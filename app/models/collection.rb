class Collection < ApplicationRecord
  has_many :collection_animes, -> { order(position: :asc) }, dependent: :destroy
  has_many :animes, through: :collection_animes

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug, on: :create

  scope :featured, -> { where(featured: true).order(position: :asc) }

  def to_param
    slug
  end

  private

  def generate_slug
    self.slug = title.to_s.parameterize if slug.blank?
  end
end
