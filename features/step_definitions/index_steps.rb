Given(/^I am at the main page$/) do
  visit '/'
end

Then(/^I should see the message '(.*)'$/) do |text|
  last_response.body.should =~ /#{text}/m
end

Then(/^I should see a button with id '(.*?)'$/) do |button|
  last_response.should have_xpath("//button[@id=\"#{button}\"]")
end

Then(/^I should see a button2 with id '(.*?)'$/) do |button2|
  last_response.should have_xpath("//button[@id=\"#{button2}\"]")
end

Then(/^I should see a button3 with id '(.*?)'$/) do |button3|
  last_response.should have_xpath("//button[@id=\"#{button3}\"]")
end

When /^I press the button with id '(.*)'$/ do |name|
  click_link(name)
end

Then (/^I should be at the game page with message '(.*)'$/)  do |text|
  last_response.body.should =~ /#{text}/m
end

Then(/^I should see an image with id '(.*?)'$/) do |img|
  last_response.should have_xpath("//img[@id=\"#{img}\"]")
end

Then (/^I should be at the confirmationcreate page with message '(.*)'$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end
Then (/^I should be at the confirmationlist page with message '(.*)'$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end
Then (/^I should be at the best page with message '(.*)'$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end



