class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis #, dependent: :destroy

  # before_save {self.role ||= :standard }
  after_initialize {self.role ||= :standard }    #after_initialize callback - default role = standard 

  enum role: [:standard, :premium, :admin]
end
