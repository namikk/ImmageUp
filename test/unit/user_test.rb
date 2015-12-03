require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:name].empty?
  end

  test "a user should enter an email" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:email].empty?
  end

  test "a user should have a unique name" do
  	user = User.new
	user.name ="james"
	user2 = User.new
	user.name="james"
  	assert !user2.save
  	assert !user2.errors[:name].empty?
  end

end
