class CollectionAnime < ApplicationRecord
  belongs_to :collection
  belongs_to :anime

  validates :anime_id, uniqueness: { scope: :collection_id }
end
