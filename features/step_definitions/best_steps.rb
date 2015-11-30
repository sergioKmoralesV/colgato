Given(/^I am in the best page$/) do
  visit '/best'
end

Then(/^I should see a table with id "([^"]*)"$/) do |table|
  last_response.should have_xpath("//table[@id=\"#{table}\"]")
end
