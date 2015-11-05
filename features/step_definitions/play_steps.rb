Given(/^I am in the play page $/) do
  visit '/'
end

When(/^I input "(.*?)" in the textarea "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end

When(/^press the botton "(.*?)"$/) do |botton|
  click_button(botton)
end

Then(/^I should see "(.*?)"$/) do |letter|
  last_response.body.should =~ /#{letter}/m
end

