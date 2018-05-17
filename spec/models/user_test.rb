# require 'test_helper'
require 'rails_helper'
include RandomData

class UserTest < ActiveSupport::TestCase
  Devise::Test::IntegrationHelpers
end
