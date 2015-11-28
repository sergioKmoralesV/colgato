
Given(/^I am at the confirmationlist page$/) do
  visit '/confirmationlist'
end

Then (/^I should be at the list page with message "([^"]*)"$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end