class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  VALID_ROLES = [ 'admin', 'guest' ]

  validate :role, inclusive: { in: VALID_ROLES }

end
