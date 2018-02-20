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
    user.present?
  end

  def destroy?
    user.present? and (user.admin? or user == @wiki.user)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.present? and user.admin?
        wikis = scope.all
      elsif user.present? and user.premium?
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || user == wiki.user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.users.include?(user) || user == wiki.user
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
