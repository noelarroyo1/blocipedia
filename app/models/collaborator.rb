class Collaborator < ApplicationRecord
  belongs_to :users
  has_many :wikis, through: :users
end
