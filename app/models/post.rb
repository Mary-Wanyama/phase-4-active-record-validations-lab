class Post < ApplicationRecord
    validates :title, presence: true 
    validates :summary, length: {maximum: 250}
    validates :content, length:{minimum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :clickbait?

    ALLOWED = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess /i
    ]


    def clickbait?
        if ALLOWED.none? { |click| click.match title}
            errors.add(:title, "invalid title")
        end
    end
end
