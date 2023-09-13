# frozen_string_literal: true

require 'allure-cucumber'

module AllureHelper
  class << self
    def configure
      AllureCucumber.configure do |config|
        config.results_directory = 'allure-results'
        config.clean_results_directory = true
      end
    end

    def add_screenshot(screenshot_name)
      Allure.add_attachment(
        name: name,
        source: File.open("allure-results/screenshots/#{screenshot_name}.png"),
        type: Allure::ContentType::PNG,
        test_case: true
       )
     end

  end
end