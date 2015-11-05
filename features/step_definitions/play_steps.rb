Given(/^I am in the play page $/) do
  visit '/'
end

When(/^I input "(.*?)" in the textarea "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end

When(/^press the button "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^should see "(.*?)"$/) do |letter|
  last_response.body.should =~ /#{letter}/m
end

And(/^should see "(.*?)"$/) do |label|
  last_response.body.should =~ /#{label}/m
end

