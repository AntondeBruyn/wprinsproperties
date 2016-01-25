require "rails_helper"

RSpec.feature "Creating Properties" do
  scenario "A user can create a new property" do
    visit "/"

    click_link "New Property"

    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor for everyone"
    click_button "Create Property"

    expect(page).to have_content("Property has been created.")
  end
end
