class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_movies
  has_many :movies, through: :user_movies
  
  def old_enough m
    r = m.rating
    age = self.age
    if r == "R"
      if age <=17
        false
      else
        true
      end
    else
      true
    end
  end

  def checkout_movie m
    movies = self.movies.count
    unless movies >= self.plan
      if self.old_enough m
        UserMovie.create(user_id: self.id, movie_id: m.id)
      end
    end
  end

  def stream_movie m 
    self.stream && self.old_enough(m)
  end

  def checkin_movie m
    if self.movies.include? m
      UserMovie.find_by(user_id: self.id, movie_id: m.id).delete
    end
  end

end
