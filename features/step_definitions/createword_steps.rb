Given(/^I am in the createword page$/) do
  visit '/createword'
end

When(/^I input "(.*?)" in the area "(.*?)"$/) do |value1, textarea2|
  fill_in(textarea2, :with => value1)
end

When(/^press the button with id "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^I should see the word "([^"]*)"$/) do |arg1|
  last_response.body.should =~ /#{arg1}/m
end

Then(/^I should see the word "([^"]*)" in the label with id "([^"]*)"$/)do |value_message, textarea_message|
  last_response.should have_xpath("//label[@id=\"#{textarea_message}\"]")
  last_response.body.should =~ /#{value_message}/m
end
