class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :scraps, dependent: :destroy
   has_many :credits, dependent: :destroy
   belongs_to :organization
   belongs_to :rolable, :polymorphic => true

  accepts_nested_attributes_for :organization

  def has_role?(*role_names)
    self.rolable(name: role_names).present?
  end

end
