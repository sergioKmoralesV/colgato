When(/^press the button "([^"]*)" for the word gato$/) do |arg1|
  click_button('Borrargato')
end

Then(/^I should not see "([^"]*)"$/) do |word|
  last_response.body.should_not =~ /#{word}/m
end
