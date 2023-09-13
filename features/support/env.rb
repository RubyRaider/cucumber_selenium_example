# frozen_string_literal: true

require_relative '../../helpers/driver_helper'
require_relative '../../helpers/allure_helper'

include DriverHelper

Before do
  driver
end

After do |scenario|
  driver.save_screenshot("allure-results/screenshots/#{scenario.name}.png")
  AllureHelper.add_screenshot(scenario.name)
  driver.quit
end
