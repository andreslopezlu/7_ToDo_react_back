class Item < ApplicationRecord
  belongs_to :todo_list

  validates :description, presence: true
  validates :todo_list, presence: true
end
