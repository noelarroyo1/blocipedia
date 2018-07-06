class Wiki < ApplicationRecord
  belongs_to :user
  scope :public_wikis, -> { where(private: false) }

  before_create :set_private

  private

  def set_private
    self.private ||= false;
  end
end
