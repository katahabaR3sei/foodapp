require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  # setup do
  #   user = users(:hayashi)
  #   visit login_path
  #   fill_in 'user_session[password]', with: user.password
  # end

  def create_user
    visit new_user_path
    fill_in "user[name]", with: "sample.name"
    fill_in "user[email]", with: "sample2@example.com"
    select "男性", from: "user[sex]"
    select "30代", from: "user[age]"
    find_by_id("user_address_id").click
    select "東京都", from: "user[address_id]"
    fill_in "user[password]", with: "sample2020"
    fill_in "user[password_confirmation]", with: "sample2020"
    click_on "登録"
  end

  test "ユーザー登録ができる" do
    create_user
    assert_text("登録が完了しました")
  end

  test "ログインができる" do
    create_user
    visit login_path
    fill_in "session[email]", with: "sample2@example.com"
    fill_in "session[password]", with: "sample2020"
    find('input[type="submit"]').click
    assert_text("ログインしました")
  end
end
