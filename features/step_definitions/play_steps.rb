Given(/^I am in the play page$/) do
  $juego.start
  visit '/play'
end

When(/^I input "(.*?)" in the textarea "(.*?)"$/) do |value, textarea|
  fill_in(textarea, :with => value)
end

When(/^press the button "(.*?)"$/) do |button|
  click_button(button)
end

Then(/^should see "(.*?)"$/) do |letter|
  last_response.body.should =~ /#{letter}/m
end

And(/^should see "(.*?)"$/) do |label|
  last_response.body.should =~ /#{label}/m
end

When(/^I guess a correct letter$/) do
  fill_in("letter", :with => $juego.word.first)
  click_button("play")
end

Then(/^I should see the letter$/) do
  last_response.body.should =~ /#{$juego.word.first}/m
end

Then(/^I should see the letter in the word$/) do
  $juego.guess.each do |letra|
    last_response.body.should =~ /#{letra}/m
  end
end

Then(/^I should see a new part of the cat$/) do
  last_response.should have_xpath("//img[@src=\"#{"/images/intento"+$juego.trials.to_s+".jpg"}\"]")
end
