class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         has_many :wikis

         after_initialize { self.role ||= :standard}


        # validates :name, length: { minimum: 1, maximum: 25 }, presence: true
        # validates :email, length: { minimum: 3, maximum: 254 }

         enum role:[:standard, :premium, :admin]
end
