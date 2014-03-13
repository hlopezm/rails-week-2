class EventPolicy < ApplicationPolicy
#  class Scope < Struct.new(:user, :scope)
#    def resolve
#      scope
#    end
#  end
  def new?
    true
  end
  def create?
    true
  end
  def edit?
    @user == @record.user
  end
end
