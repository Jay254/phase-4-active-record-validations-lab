class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :title_is_clickbait
  
    def title_is_clickbait
      clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
      if title.present? && !clickbait_phrases.any? { |phrase| title.include?(phrase) }
        errors.add(:title, "should be clickbait-y")
      end
    end
  end