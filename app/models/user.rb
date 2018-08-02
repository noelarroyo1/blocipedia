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

  def expose_wikis
    self.wikis.update_all(private: false)
  end
end
