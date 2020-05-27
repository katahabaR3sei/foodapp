require "application_system_test_case"
class UsersTest < ApplicationSystemTestCase
  setup do
    user = usres(:hayashi)
    visit login_path
    fill_in 'user_session[password]', with: user.password
  end

  test "ユーザー登録ができる" do
    visit new_user_path
    fill_in "user[name]", with: 'sample.name'
    fill_in "user[email]", with: 'sample@example.com'
    fill_in "user[sex]", with: '男性'
    fill_in "user[age]", with: '30代'
    fill_in "user[image]", with: '#'
    fill_in "user[password_digest]", with: 'sample'
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end
 
  test "ログインができる" do
    visit login_path
    fill_in "session[email]", with: "sample@example.com"
    fill_in "session[password]", with: "sample"
    click "ログイン"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end

  test "店舗投稿ができる" do
    visit new_shop_path 
    fill_in "shop[name]", with: "shop1"
    fill_in "shop[image]", with: "sample"
    fill_in "shop[title]", with: "sample"
    select "イタリアン", from: "shop[genre_id]"
    select "1円〜999円", from: "shop[pricerange_id"
    select "東京都", from: "shop[address_id]"
    fill_in "shop[description]", with: "sample"
    click "登録する！"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end

  test "検索ができる" do
    visit search_shops_path
    set('text'), with: name
    click "検索"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
  end
