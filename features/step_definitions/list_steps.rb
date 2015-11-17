
Given(/^I am in the list page$/) do
  visit '/list'
end

Then(/^I should see list of words "(.*?)"$/) do |words|
  last_response.should have_xpath("//ul[@id=\"#{words}\"]")
end
