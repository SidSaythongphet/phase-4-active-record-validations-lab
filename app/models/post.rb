class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_clickbait?

    private

    def title_is_clickbait?
        titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

        if titles.none? { |t| t.match title } 
            errors.add(:title, "title is clickbait")
        end
    end

end
