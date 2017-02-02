class Picture < ApplicationRecord
# FIN = 20
# INIT = 3
# scope :range, -> { where('title > ? AND title < ?', INIT, FIN) }

  validates :artist, presence: { message: "Squirrel!"},
                    length: {minimum:1}

  validates :title, presence: true
  validate :title_range



  validates :url, presence: true,
                  uniqueness: {messages: "This url already exists"}


  def title_range
    return if title == nil
    if title.length > 20 || title.length < 3
      errors.add(:title, "Name must be between 3-20 characters")
    end
  end
end
