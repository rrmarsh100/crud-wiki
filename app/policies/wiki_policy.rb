class WikiPolicy < ApplicationPolicy

  def create?
    user.present?
  end

  def update?
    user.present? && record.private == false
  end
end
