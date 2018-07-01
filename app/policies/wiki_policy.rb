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
    if @wiki.private?
      user.admin? or record.user.id == user.id
    else
      user
    end
  end

  def create?
    user.present?
  end

  # class Scope < Scope
  #   def resolve
  #     if user.admin
  #       return scope.all
  #     else
  #       a = []
  #       scope.all.each do |w|
  #         if w.user == user || !w.private
  #           a << w
  #         end
  #       end
  #     end
  #     return a
  #   end
  # end
end
