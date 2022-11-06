class Product < ActiveRecord::Base
    has_many :reviews
    has_many :users, through: :reviews

    def leave_review(user, star_rating, comment)
        self.reviews.create(user: user, star_rating: star_rating, comment: comment)
    end
    
    def print_all_reviews 
        self.reviews.each do |x|
            puts "Review for #{x.product.name} by #{x.user.name}: #{x.star_rating}. #{x.comment}"
        end
    end

    def average_rating
        self.reviews.average(:star_rating)
    end
end