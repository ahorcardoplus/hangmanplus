Given(/^I open the application$/) do
  visit "/"
end

When(/^I start the game$/) do
  click_button("Start")
end

Then(/^I should see the text "([^"]*)"$/) do |text|
  expect(page.body).to match text
end

Given(/^I started a game$/) do
  visit "/"
  click_button("Start")
end

When(/^I change the phrase$/) do
  click_button("Change Phrase")
end

When(/^The phrase is "([^"]*)" and I type "([^"]*)"$/) do |phrase, letter|
  fill_in("letter", :with => letter)
  click_button("Guess")
end
