ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def init_user
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
    visit login_path
    fill_in "session[email]", with: "sample2@example.com"
    fill_in "session[password]", with: "sample2020"
    find('input[type="submit"]').click
  end

  # Add more helper methods to be used by all tests here...
end
