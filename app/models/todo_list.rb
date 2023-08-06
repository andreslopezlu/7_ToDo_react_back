class TodoList < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true
end
