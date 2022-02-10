require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @email = "test@gmail.com"
    @first_name = "First"
    @preferred_name = "Preferred"
    @last_name = "Last"
    @pronouns = "they/them"
    @password = "password123"
  end

  # New

  test "For new user, no default first_name, preferred_name, last_name or pronouns" do
    user = nil

    assert_no_difference "User.count" do
      user = User.new()
    end

    assert user
    assert_nil user.first_name
    assert_nil user.preferred_name
    assert_nil user.last_name
    assert_nil user.pronouns
  end

  test "For new user, non-admin by default" do
    user = nil

    assert_no_difference "User.count" do
      user = User.new()
    end

    assert user
    assert_equal false, user.admin
  end

  # Create

  test "Create user successfully with first_name, last_name, email and password" do
    user = nil

    assert_difference "User.count", 1 do
      user = User.create(
        first_name: @first_name,
        last_name: @last_name,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert user
    assert_equal @email, user.email
    assert_equal @first_name, user.first_name
    assert_equal @last_name, user.last_name
    assert_nil user.pronouns
    assert_nil user.preferred_name
  end

  test "Create user successfully, while providing preferred_name and pronouns" do
    user = nil

    assert_difference "User.count", 1 do
      user = User.create(
        first_name: @first_name,
        last_name: @last_name,
        preferred_name: @preferred_name,
        pronouns: @pronouns,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert user
    assert_equal @email, user.email
    assert_equal @first_name, user.first_name
    assert_equal @last_name, user.last_name
    assert_equal @preferred_name, user.preferred_name
    assert_equal @pronouns, user.pronouns
  end

  test "Created user is non-admin by default"  do
    user = nil

    assert_difference "User.count", 1 do
      user = User.create(
        first_name: @first_name,
        last_name: @last_name,
        preferred_name: @preferred_name,
        pronouns: @pronouns,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert user
    refute user.admin
  end

  test "Successfully create admin user" do
    user = nil

    assert_difference "User.count", 1 do
      user = User.create(
        admin: true,
        first_name: @first_name,
        last_name: @last_name,
        preferred_name: @preferred_name,
        pronouns: @pronouns,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert user
    assert user.admin
  end

  test "No creation or save if no first name" do
    user = nil

    assert_no_difference "User.count" do
      user = User.create(
        last_name: @last_name,
        preferred_name: @preferred_name,
        pronouns: @pronouns,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert_no_difference "User.count" do
      user.save
    end
  end

  test "No creation or save if no last name" do
    user = nil

    assert_no_difference "User.count" do
      user = User.create(
        first_name: @first_name,
        preferred_name: @preferred_name,
        pronouns: @pronouns,
        email: @email,
        password: @password,
        password_confirmation: @password,
      )
    end

    assert_no_difference "User.count" do
      user.save
    end
  end

  # Update

  test "Successful update" do
    user = users(:admin)
    new_first_name = @first_name

    user.update(first_name: new_first_name)

    updated_user = User.find(user.id)
    assert_equal new_first_name, updated_user.first_name
  end

  test "Successful update if clearing preferred name and pronouns" do
    user = users(:employee1)
    new_first_name = @first_name
    new_preferred_name = nil
    new_pronouns = nil

    user.update(first_name: new_first_name, preferred_name: new_preferred_name, pronouns: new_pronouns)

    updated_user = User.find(user.id)
    assert_equal new_first_name, updated_user.first_name
    assert_nil updated_user.preferred_name
    assert_nil new_pronouns, updated_user.pronouns
  end

  test "No update if no first name" do
    user = users(:employee1)
    new_first_name = nil
    new_last_name = @last_name

    user.update(first_name: new_first_name, last_name: new_last_name)

    updated_user = User.find(user.id)
    assert_not_equal new_first_name, updated_user.first_name
    assert_not_equal new_last_name, updated_user.last_name
  end

  test "No update if no last name" do
    user = users(:employee1)
    new_first_name = @first_name
    new_last_name = nil

    user.update(first_name: new_first_name, last_name: new_last_name)

    updated_user = User.find(user.id)
    assert_not_equal new_first_name, updated_user.first_name
    assert_not_equal new_last_name, updated_user.last_name
  end

  # Destroy

  test "Destroy successfully" do
    user = users(:admin)

    assert User.exists?(user.id)

    assert_difference "User.count", -1 do
      user.destroy
    end

    refute User.exists?(user.id)
  end

  # Other

  test "Correct display names for user without preferred name" do
    user = users(:employee2)

    assert user
    assert_equal "Joseph", user.display_first_name
    assert_equal "Joseph McKinney", user.display_full_name
  end

  test "Correct display names for user with preferred name" do
    user = users(:employee1)

    assert user
    assert_equal "Tammy", user.display_first_name
    assert_equal "Tammy Tagasa", user.display_full_name
  end

  # TODO: Add timesheet tests
end
