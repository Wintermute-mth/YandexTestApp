class NewsItem < ApplicationRecord
  validates :title, :description, :expire_at, presence: true

  def self.current_item
    find_by("expire_at > ?", Time.current)
  end
end