class Movie < ActiveRecord::Base
  has_many :users, through: :user_movies

  validates :title, presence: true
  validates :rating, presence: true
end
