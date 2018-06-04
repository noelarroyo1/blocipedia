class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wikis)
    @user = user
    @wikis = wikis
  end

  def update?
    user.present?
  end
end
