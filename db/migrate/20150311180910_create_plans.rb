class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.boolean   :stream, default: true
      t.integer   :checkout, limit: 10
      t.integer   :user_id

      t.timestamps null: false
    end
  end
end
