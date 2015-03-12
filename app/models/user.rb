class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_movies
  has_many :movies, through: :user_movies
  
  def checkout movie_id
    self.user_movies.first_or_create!(movie_id: movie_id.to_i)
  end


end
