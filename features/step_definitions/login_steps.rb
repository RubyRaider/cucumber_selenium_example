# frozen_string_literal: true

require_relative '../../page_objects/pages/account_page'
require_relative '../../page_objects/pages/login_page'

Given("I'm a {user} on the login page") do |user|
  @user = user
  @login_page = LoginPage.new(driver)
  @login_page.visit
end

When('I login with my credentials') do
  @login_page.login(@user['username'], @user['password'])
end

Then("I'm logged in") do
  account_page = AccountPage.new(driver)
  expect(account_page.header.customer_name).to eq "Welcome back #{@user['name']}"
end