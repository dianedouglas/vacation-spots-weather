require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users
  test "user need unique name" do
    user = User.new(name: users(:one).name,
    password: 'secret',
    password_confirmation: 'secret' )
    assert user.invalid?
    assert_equal ["has already been taken"], user.errors[:name]
  end
end
