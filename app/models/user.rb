class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

#  scope :users_by_manager, lambda{|manager_id| where("manager_id=?", manager_id)}

  belongs_to :user_type

  has_many :user_days

  has_many :vacations

  validates_presence_of :email, :forename, :surname, :manager_id, :user_type

  attr_accessible :email, :password, :password_confirmation, :forename, :surname, :user_type_id, :manager_id




end
