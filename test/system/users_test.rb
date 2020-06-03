require "application_system_test_case"
class UsersTest < ApplicationSystemTestCase
  # setup do
  #   user = users(:hayashi)
  #   visit login_path
  #   fill_in 'user_session[password]', with: user.password
  # end

  test "ユーザー登録ができる" do
    visit new_user_path
    fill_in "user[name]", with: 'sample.name'
    fill_in "user[email]", with: 'sample@example.com'
    select '男性', from: "user[sex]"
    select "30代", from: "user[age]"
    find_by_id("user_address_id").click
    select "東京都", from: "user[address_id]"
    fill_in "user[password]", with: 'sample2020'
    fill_in "user[password_confirmation]", with: 'sample2020'
    click_on "登録"
    assert_text("登録が完了しました")
  end
 
  # test "ログインができる" do
  #   visit login_path
  #   fill_in "session[email]", with: "sample@example.com"
  #   fill_in "session[password]", with: "sample"
  #   click "ログイン"
  #   page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  #   assert_text("ログインしました")
  # end
end