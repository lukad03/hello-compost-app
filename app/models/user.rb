class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :scraps
   has_many :credits
   belongs_to :location

  validates_presence_of :username
  validates_uniqueness_of :username

  def to_param
    username
  end
end
