Given /^I am at the register page$/ do
  visit '/register'
end

When(/^I input "(.*?)" in the textarea with id "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end
