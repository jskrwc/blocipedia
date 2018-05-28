class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.present?
  end

  def create?
    user.present?
  end

  def new?
    user.present?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    user == record.user || user.role == "admin"
  end


  class Scope < Scope
    def resolve
      scope
    end
  end

  
end
