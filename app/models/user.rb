class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  before_create :add_avatar

  validates :name, presence: true

  has_many :todo_lists, dependent: :destroy

  private

  def add_avatar
    self.avatar = "https://api.dicebear.com/6.x/bottts/svg?seed=#{CGI.escape(name)}"
  end
end
