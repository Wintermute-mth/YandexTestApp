class NewsItem < ApplicationRecord
  validates :title, :description, :expire_at, presence: true
  validate :check_expire_at

  def self.current
    find_by("expire_at > ?", Time.current)
  end

  private

  def check_expire_at
    if expire_at && expire_at.beginning_of_minute < Time.now.beginning_of_minute
      errors.add(:expire_at, 'Не может быть меньше текущего времени')
    end
  end
end