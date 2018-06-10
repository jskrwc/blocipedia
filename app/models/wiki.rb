class Wiki < ApplicationRecord
  belongs_to :user

  before_save {self.private ||= false }  #set default for private attribute to false

end
