class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def index?
    true
  end

  def show?
    scope.where(id: record.id).exist?
  end

  def new?
   user.present?
  end

  def edit?
   user.present?
  end

  def destroy?
    user.admin? or record.user.id == user.id
  end
  
  def update?
    user.present?
  end

  def create?
    user.present?
  end
end
