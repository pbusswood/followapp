require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a username" do
    user = User.new
    assert !user.save
    assert !user.errors[:username].empty?
  end

  test "a user should enter a unique username" do
    user = User.new
    user.username = users(:parker).username

    assert !user.save
    assert !user.errors[:username].empty?
  end

  test "a user should have a profile name without spaces" do
    user = User.new(first_name: 'Parker', last_name: 'Busswood', email: 'parkerbusswood2@gmail.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.username = "My Username"

    assert !user.save
    assert !user.errors[:username].empty?
    assert user.errors[:username].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: 'Parker', last_name: 'Busswood', email: 'parkerbusswood2@gmail.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.username = 'parkerbusswood_1'
    assert user.valid?
  end
end
