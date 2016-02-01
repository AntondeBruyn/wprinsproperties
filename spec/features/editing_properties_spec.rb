require "rails_helper"

RSpec.feature "Editing Properties" do
  before do
    FactoryGirl.create(:property, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Property"
  end

  scenario "Updating a property" do
    fill_in "Name", with: "Sublime Text 3 beta"
    click_button "Update Property"

    expect(page).to have_content("Property has been updated.")
  end

  scenario "Updating a property with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Property"

    expect(page).to have_content("Property has not been updated.")
  end
end
