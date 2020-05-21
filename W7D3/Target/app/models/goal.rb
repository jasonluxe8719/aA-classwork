class Goal < ApplicationRecord
    validates :title, :body, :user_id, :private, presence: true 

    belongs_to :user
end
