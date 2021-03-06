Given (/^I am at the fail page but I have a score$/) do
  $juego.start
  $juego.get_points()
  visit '/fail'
end

Then(/^I should see the phrase '(.*)'$/) do |text|
  last_response.body.should =~ /#{text}/m
end

Then /^I should see a question "(.*)"$/ do |text|
  last_response.body.should =~ /#{text}/m
end

And(/^I should see the image "(.*?)"$/) do |image_name|
  last_response.should have_xpath("//img[@src=\"#{image_name}\"]")
end

And(/^I should see one button with id '(.*?)'$/) do |button|
  last_response.should have_xpath("//button[@id=\"#{button}\"]")
end

When(/^I make (\d+) mistakes$/) do |error|
  (0..(error.to_i-1)).each do
   fill_in("letter", :with => "x")
   click_button("play")
  end
end

Then(/^I should see the clue$/) do
  last_response.body.should =~ /#{$clue}/m
end

Then(/^I should see the description of the word$/) do
  last_response.body.should =~ /#{$juego.description}/m
end
