Given /^I am at the fail page$/ do
  visit '/fail'
end

Then(/^I should see the phrase '(.*)'$/) do |text|
  last_response.body.should =~ /#{text}/m
end

Then /^I should see a question "(.*)"$/ do |text|
save_and_open_page
  last_response.body.should =~ /#{text}/m
end

And(/^I should see the image "(.*?)"$/) do |image_name|
  last_response.should have_xpath("//img[@src=\"#{image_name}\"]")
end

And(/^I should see one button with id '(.*?)'$/) do |button|
  last_response.should have_xpath("//button[@id=\"#{button}\"]")
end

When(/^I make (\d+) mistakes$/) do |error|

end
