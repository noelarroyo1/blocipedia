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
    record.user == current_user || record.collaborating_users.include?(user)
  end

  def destroy?
    user.admin? or record.user.id == user.id
  end

  def update?
    record.user == current_user || record.collaborating_users.include?(user)
  end

  def create?
    user.present?
  end

class Scope
  def resolve
    wikis = []
      if user.admin?
        wikis = scope.all
      else
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.collaborating_users.include?(user) || user == record.user
            wikis << wiki
          end
        end
      end
     wikis
    end
  end
end
