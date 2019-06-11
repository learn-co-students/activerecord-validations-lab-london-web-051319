class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 100 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    CLICKBAIT = [
      /Won't Believe/i,
      /Secret/i,
      /Top [0-9]*/i,
      /Guess/i
    ]
  
    def is_clickbait?
      if CLICKBAIT.none? { |pettern| pettern.match title }
        errors.add(:title, "must be clickbait")
      end
    end
end
