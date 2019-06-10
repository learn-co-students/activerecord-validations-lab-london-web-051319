require 'pry'

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :title_clickbait

  def title_clickbait
    #if title.present? && !(["Won't Believe",'Secret','Top ', 'Guess'].any?{|str| title.include?(str)})
    if title.present? && !(["Won't Believe",'Secret', 'Guess'].any?{|str| title.include?(str)}) && !title.match?(/.*Top \d+/)
      errors.add(:title, "Title not clickbaity enough")
    end
  end
end
