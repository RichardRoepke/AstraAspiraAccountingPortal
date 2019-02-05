class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, presence: true

  acts_as_paranoid
  validates_as_paranoid
  validates_uniqueness_of_without_deleted :email
end
