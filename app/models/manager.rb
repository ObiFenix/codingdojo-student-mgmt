class Manager < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  before_validation :downcase_fields
  validates :first_name, :last_name,  presence: true, length: { in: 2..25 }
  validates :email, :password, :password_confirmation, presence: true

  belongs_to :dojo
  has_many :students, :dependent => :destroy # all available students in a dojo
  has_many :students_added, through: :joins, source: :students # students added by a manager

  private
    def downcase_fields
      self.email.downcase!
    end
end
