class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis #, dependent: :destroy

  has_many :collaborators

  before_save {self.role ||= :standard }

  after_initialize :init

  def init
    self.role ||= :standard     # use after_initialize callback to set default(s) for attributes, associations
  end

  enum role: [:standard, :premium, :admin]
end
