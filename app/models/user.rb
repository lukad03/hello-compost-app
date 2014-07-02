class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   belongs_to :rolable, polymorphic: true, dependent: :destroy

  def has_role?(*role_names)
    self.rolable(name: role_names).present?
  end

end
