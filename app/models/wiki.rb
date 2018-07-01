class Wiki < ApplicationRecord
  belongs_to :user
  scope :public_wikis, -> { where(private: false) }
end
