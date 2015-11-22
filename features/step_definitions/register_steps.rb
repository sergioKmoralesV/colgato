Given /^I am at the register page$/ do
  visit '/register'
end

When(/^I input "(.*?)" in the textarea with id "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end

And(/^press the button with name"(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see '(.*)'$/) do |name|
  last_response.body.should =~ /#{name}/m
end

