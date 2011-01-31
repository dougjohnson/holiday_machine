class User < ActiveRecord::Base
  devise :database_authenticatable, :confirmable, :lockable, :recoverable,
         :rememberable, :registerable, :trackable, :timeoutable, :validatable,
         :token_authenticatable

  belongs_to :user_type

  has_many :vacations

  attr_accessible :email, :password, :password_confirmation, :days_leave, :user_type_id, :manager_id

end
