require 'action_view'

class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :sex, presence: true, inclusion: ["M", "F"]
    validates :color, presence: true, inclusion: ["white", "brown", "black", "calico", "hairless", "mixed", "orange"]
    validates :birth_date, :name, presence: true


    def age
        time_ago_in_words(self.birth_date)
    end
end