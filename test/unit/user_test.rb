require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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

  test "a user should enter a profile name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

   test "a user should enter an email address" do
    user = User.new
    assert !user.save
    assert !user.errors[:email].empty?
  end

 test "a user's email address should be unique" do
    user = User.new
    user.email = users(:jesse).email

    assert !user.save
    assert !user.errors[:email].empty?
  end

  test "a user should have a unique profile name" do
  	user = User.new
  	user.profile_name = users(:jesse).profile_name

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  end

  test "a user's profile name should not contain spaces" do
  	user = User.new
  	user.profile_name = "Jesse Weeks"

  	assert !user.save
  	assert !user.errors[:profile_name].empty?
  	assert user.errors[:profile_name].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted profile name" do
    user = User.new(first_name: "Jesse", last_name: "Weeks", email:"jesse23@jesseweeks.net")
    user.password = user.password_confirmation = "j123a123"

    user.profile_name = "jesse_weeks1"
    assert user.valid?
  end

end