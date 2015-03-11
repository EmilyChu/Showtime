class CreateUserMovies < ActiveRecord::Migration
  def change
    create_table :user_movies do |t|
      t.belongs_to :user
      t.belongs_to :movie

      t.timestamps null: false
    end
  end
end
