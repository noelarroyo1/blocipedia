class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  after_initialize :set_role

  def set_role
    self.role ||= :standard
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  has_many :wikis

  enum role: [:standard, :premium, :admin]

  def downgrade
    if self.role == "premium"
      self.role = "standard"
    end
  end

end
