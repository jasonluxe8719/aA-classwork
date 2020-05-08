class Visit < ApplicationRecord
  

  belongs_to :visitor,
    primay_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :shortened_url,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :ShortenedUrl

end
