require "application_system_test_case"
class UsersTest < ApplicationSystemTestCase
  test "ユーザー登録ページにアクセスできる" do
    visit login_path
    assert_text "ログインページ"
  end
  test "ユーザー登録ができる" do
    visit new_user_path
    fill_in "user[name]", with: 'sample.name'
    fill_in "user[email]", with: 'sample@example.com'
    fill_in "user[sex]", with: '男性'
    fill_in "user[age]", with: '30代'
    fill_in "user[image]", with: '#'
    fill_in "user[password_digest]", with: 'lawn40yuu'
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end
  test "ログイン確認" do
    visit login_path
    fill_in "user[email]", with: 'sample@example.com'
    fill_in "user[password_digest]", with: 'lawn40yuu'
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end