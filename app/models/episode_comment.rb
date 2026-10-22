class EpisodeComment < ApplicationRecord
  belongs_to :episode

  validates :body, presence: true, length: { minimum: 2, maximum: 500 }
  validates :user_name, presence: true

  REACTION_ICONS = {
    "fire" => "🔥",
    "hype" => "⚡",
    "tears" => "😭",
    "mindblown" => "🤯",
    "wholesome" => "💖"
  }.freeze

  def reaction_icon
    REACTION_ICONS[reaction_type] || "✨"
  end
end
