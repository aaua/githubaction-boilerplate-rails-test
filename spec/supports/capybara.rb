require 'capybara/rspec'
require 'capybara/rails'
require 'capybara-screenshot/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL
end

Capybara.register_driver :chrome do |app|
  args = %w[disable-gpu mute-audio window-size=375,800 lang=ja no-sandbox disable-extensions disable-desktop-notifications]
  args << 'headless' unless ENV['NO_HEADLESS']

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
      chrome_options: {
        args: args,
        w3c: false
      }
    )
  )
end

Capybara.server = :webrick

# FIXME: "/assets/frontend/swiper.min.js.map" のルーティングエラーが発生してしまうため
Capybara.raise_server_errors = false

Capybara.default_driver = :chrome
Capybara.default_max_wait_time = 6
Capybara::Screenshot.register_driver(:chrome) do |driver, path|
  driver.browser.save_screenshot(path)
end

# require 'billy/capybara/rspec'
# # NOTE:
# # see https://github.com/oesmith/puffing-billy/blob/16a90c03b93b9fe6b80548390ad4901a9fd907e1/lib/billy/browsers/capybara.rb
# Capybara.register_driver :chrome_billy do |app|
#   args = %W(disable-gpu mute-audio window-size=1280,800 lang=ja enable-features=NetworkService,NetworkServiceInProcess ignore-certificate-errors proxy-server=#{Billy.proxy.host}:#{Billy.proxy.port})
#   args << 'headless' unless ENV['NO_HEADLESS']
#
#   Capybara::Selenium::Driver.new(
#     app,
#     browser: :chrome,
#     desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
#       chrome_options: {
#         args: args,
#         w3c: false
#       }
#     )
#   )
# end
