class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  VALID_ROLES = [ 'admin', 'guest' ]

  validate :role, inclusive: { in: VALID_ROLES }
  validate :full_name, presence: true

  after_create :assign_invite_code

  def admin?
  	return role == 'admin'
  end

  def guest?
  	return role == 'guest'
  end

  def password_required?
    super if self.admin?
    false
  end

  def children
    relations = GuestRelationship.where(parent_id: self.id)
    User.where(id: relations.map(&:child_id))
  end

  def parent
    relations = GuestRelationship.where(child_id: self.id)
    User.where(id: relations.first.parent_id)
  end

  private

  def assign_invite_code
    invite_code = "#{id}#{(SecureRandom.random_number*100000).to_i}".to_i
    save!
  end
end
