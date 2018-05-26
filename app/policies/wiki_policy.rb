class WikiPolicy < ApplicationPolicy

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def create?
    false
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
    true if record.user == user || user.role == "admin"
  end


  # class Scope < Scope
  #   def resolve
  #     scope
  #   end
  # end
end
