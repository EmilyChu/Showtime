class Plan < ActiveRecord::Base
  belongs_to :user

  validates :stream, presence: true
  validates :checkout, presence: true
end
