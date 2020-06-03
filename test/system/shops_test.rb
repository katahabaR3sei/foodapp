require "application_system_test_case"
class ShopsTest < ApplicationSystemTestCase
  setup do
    user = users(:hayashi)
    visit login_path
    fill_in 'user_session[password]', with: user.password
  end
  
  test "店舗投稿ができる" do
    visit new_shop_path 
    fill_in "shop[name]", with: "shop1"
    fill_in "shop[image]", with: "sample"
    fill_in "shop[title]", with: "sample"
    select "イタリアン", from: "shop[genre_id]"
    select "1円〜999円", from: "shop[pricerange_id]"
    select "東京都", from: "shop[address_id]"
    fill_in "shop[description]", with: "sample"
    click "登録する！"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    assert_text("投稿ありがとうございます")
  end

  test "検索ができる" do
    visit search_shops_path
    fill_in "イタリアン", with: "name"
    click "検索"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    assert_text("クチコミ平均点数")
  end
end