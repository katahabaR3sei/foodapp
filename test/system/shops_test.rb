require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  # setup do
  #   init_user
  # end

  test "店舗投稿ができる" do
    init_user
    visit new_shop_path
    fill_in "shop[name]", with: "shop1"
    fill_in "shop[title]", with: "sample"
    select "イタリアン", from: "shop[genre_id]"
    select "1000円〜1999円", from: "shop[pricerange_id]"
    select "東京都", from: "shop[address_id]"
    fill_in "shop[description]", with: "sample"
    attach_file "shop[image]", "test/upload_sample.jpg"
    click_on "登録する！"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
    assert_text("投稿ありがとうございます")
  end

  # test "ログインしていない状態で店舗登録しようとしたらリダイレクト"

  test "名前検索ができる" do
    visit search_shops_path
    fill_in "イタリアン", with: "name"
    click_on "検索"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
    assert_text("クチコミ平均点数")
  end

  test "ジャンル検索ができる" do
    visit search_shops_path
    select "イタリアン", from: "shop[genre_id]"
    click_on "検索"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
    assert_text("クチコミ平均点数")
  end

  test "価格検索ができる" do
    visit search_shops_path
    select "東京都", from: "shop[address_id]"
    click_on "検索"
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime("%Y%m%d%H%M%S")}.png"
    assert_text("クチコミ平均点数")
  end
end
