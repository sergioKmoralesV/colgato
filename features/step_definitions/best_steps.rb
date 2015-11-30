Given(/^I am in the best page$/) do
  visit '/best'
end

Then(/^I should see a table with id "([^"]*)"$/) do |table|
  last_response.should have_xpath("//table[@id=\"#{table}\"]")
end

Then(/^I should not see the number '(\d+)\)'$/) do |number|
  last_response.body.should_not =~ /#{number}/m
end
