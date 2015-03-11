class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string  :title, null: false
      t.string  :rating, null: false
      t.text    :description
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
