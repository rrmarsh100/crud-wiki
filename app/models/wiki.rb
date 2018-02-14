class Wiki < ApplicationRecord
  belongs_to :user

  default_scope { order('title ASC') }

  validates :user, presence: true
end
