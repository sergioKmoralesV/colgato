
Given(/^I am at the confirmationcreate page$/) do
  visit '/confirmationcreate'
end
Then (/^I should be at the createword page with message "([^"]*)"$/)  do |text2|
  last_response.body.should =~ /#{text2}/m
end