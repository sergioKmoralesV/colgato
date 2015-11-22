Given /^I am at the win page$/ do
  visit '/win'
end

Then(/^I should see a message '(.*)'$/) do |text|
  last_response.body.should =~ /#{text}/m
end

Then /^I should see the text "(.*)"$/ do |text|
  last_response.body.should =~ /#{text}/m
end

And(/^I should see the image "(.*?)"$/) do |image_name|
  last_response.should have_xpath("//img[@src=\"#{image_name}\"]")
end
And(/^I should see button with id '(.*?)'$/) do |button|
  last_response.should have_xpath("//button[@id=\"#{button}\"]")
end

