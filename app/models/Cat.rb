require 'date'

class Cat < ApplicationRecord

    include ActionView::Helpers::DateHelper

    CAT_COLORS = ["brown", "tortuga", "white", "void","orange"]

    validates :birth_date, :color, :name, :sex, presence: true
    validates :color, inclusion: { in: CAT_COLORS }
    validates :sex, inclusion: {in: ["M", "F"] }
    validate :birth_date_cannot_be_future

    has_many :rental_requests,
        foreign_key: :cat_id,
        class_name: :CatRentalRequest,
        dependent: :destroy

    def birth_date_cannot_be_future
        if birth_date > Date.today
            errors.add(:birth_date, "birth date cannot be in the future")
        end
    end

    def age
        now = Date.today
        d = Date.parse(self.birth_date.to_s)
        before = Date.civil(d.year, d.mon, d.day)
        difference_in_days = (now - before).to_i
        # difference_in_days/365

        time_ago_in_words(Time.now - difference_in_days.days)
    end
    
end

