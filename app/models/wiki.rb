class Wiki < ApplicationRecord
  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators

  before_save {self.private ||= false }  #set default for private attribute to false

  def public?
    !private
  end

  
end
