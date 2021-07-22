class Post < ApplicationRecord
    validates :title, presence:true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    # validates :category, matches: { 'Fiction' || 'Non-Fiction' }
    validate :fic_nonfic

    def fic_nonfic
        unless category.match?(/Fiction/||/Non-Fiction/)
            errors.add(:category, "Only Fiction or Non-Fiction please")
        end
    end
end
