# ENV['RAILS_ENV'] ||= 'test'
# require_relative '../config/environment'
# require 'rails/test_help'
# #add new 
# require 'capybara/rails'
# require 'capybara/minitest'
# require 'selenium/webdriver'

# module ActiveSupport
#   class TestCase
#     # Run tests in parallel with specified workers
#     parallelize(workers: :number_of_processors, with: :threads)

#     # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#     fixtures :all

#     # Add more helper methods to be used by all tests here...
#   end
# end
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'capybara/rails'
require 'capybara/minitest'
require 'selenium/webdriver'

class ActiveSupport::TestCase
  # Run tests in parallel with the specified number of workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Configure Capybara for integration testing
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new(args: ['no-sandbox'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end

  Capybara.javascript_driver = :selenium_chrome
  Capybara.server = :puma, { Silent: true }
  Capybara.default_max_wait_time = 5

  setup do
    Capybara.current_driver = Capybara.javascript_driver if metadata[:js]
  end

  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
