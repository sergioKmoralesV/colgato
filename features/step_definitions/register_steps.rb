Given /^I am at the register page$/ do
  visit '/register'
end

When(/^I input "(.*?)" in the textarea with id "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end
And (/^I press the button "(.*?)"$/) do |button|
  click_button(button)
end
Then (/^I should be at the show_page page with message "([^"]*)"$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end
 