# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class ShortenedUrl < ApplicationRecord
  validates :long_url, presence: true
  validates :short_url, presence: true, uniqueness: true

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit

  has_many :visitors,
    through: :visits,
    source: :visitor

  def self.random_code
    code = SecureRandom.urlsafe_base64
    code = SecureRandom.urlsafe_base64 while ShortenedUrl.exists?(short_url: code)
    code
  end

  def self.create!(user, long_url_str)
    short_url_code = ShortenedUrl.random_code
    super(long_url: long_url_str, short_url: short_url_code, user_id: user.id)
  end
end
