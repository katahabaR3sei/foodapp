require "application_system_test_case"
class PostsTest < ApplicationSystemTestCase
 
  test "クチコミ投稿ができる" do
    visit new_shop_post_path(:one)
    fill_in "post[title]", with: 'テスト'
    fill_in "post[rate]", with: '3'
    fill_in "post[taste]", with: 'テスト'
    fill_in "post[atmosphere]", with: 'テスト'
    fill_in "post[service]", with: 'テスト'
    page.save_screenshot "tmp/screenshots/#{Time.now.strftime('%Y%m%d%H%M%S')}.png"
    click_on "登録する！"
    assert_text("投稿ありがとうございます！")
  end
end