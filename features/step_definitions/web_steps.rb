require 'uri'
require 'cgi'

When /^(?:|the .+ )goes to page - "([^"]*)"$/ do |expect_path|
  visit expect_path
  sleep 1
end

Then(/^(?:|the .+ )should see "([^"]*)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^(?:|the .+ )clicks "([^"]*)"$/) do |link_name|
  click_link(link_name)
end

Then /^(?:|the .+ )should be at page - "(.*?)"$/ do |expect_path|
  current_path  = URI.parse(current_url).path
  current_query = URI.parse(current_url).query

  if current_query.blank?
    expect(current_path).to eql expect_path
  else
    current_query = URI.unescape(current_query)
    expect("#{current_path}?#{current_query}").to eq expect_path
  end
end

Then /^(?:|the .+ )fills in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field_id(field), with: value, match: :prefer_exact)
end

When /^(?:|the .+ )presses "([^\"]*)"$/ do |button|
    click_button(button)
end

And /^(?:|the .+ )accepts the confirm message$/ do
  page.driver.browser.switch_to.alert.accept
end

And /^(?:|the .+ )checks the checkbox of admin$/ do
  find(:css, "#user_admin").set(true)
end

And /^(?:|the .+ )attach the file "([^"]*)" to image field$/ do |image_path|
  page.attach_file("product_image", Rails.root + image_path)
end

And /^(?:|the .+ )should see the image "([^"]*)"$/ do |image_name|
  expect(page).to have_css("img[src*='#{image_name}']")
end
