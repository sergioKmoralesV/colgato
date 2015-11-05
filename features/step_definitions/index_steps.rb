Given(/^I am at the main page$/) do
  visit '/'
end

Then(/^I should see the message '(.*)'$/) do |text|
  last_response.body.should =~ /#{text}/m
end

Then(/^I should see a button with id '(.*?)'$/) do |button|
  last_response.should have_xpath("//button[@id=\"#{button}\"]")
end

When /^I press the button with id '(.*)'$/ do |name|
  click_link(name)
end

Then (/^I should be at the game page$/)  do
  visit '/play'
end
