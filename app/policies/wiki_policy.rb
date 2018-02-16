class WikiPolicy < ApplicationPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
      @user = user
      @wiki = wiki
  end

  def create?
    user.present?
  end

  def update?
    user.present? && record.private == false
  end

  def destroy?
    user.present? and (user.admin? or user == @wiki.user)
  end
end
