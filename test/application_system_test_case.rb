require 'test_helper'
Capybara.register_driver :selenium_chrome_headless do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  %w[
    headless window-size=1440x1080 disable-gpu
  ].each { |arg| options.add_argument(arg) }
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end
class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by(:selenium_chrome_headless)
end

