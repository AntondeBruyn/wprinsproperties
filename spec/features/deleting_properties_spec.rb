require "rails_helper"

RSpec.feature "Deleting properties" do
  scenario "Deleting a property" do
    FactoryGirl.create(:property, name: "Sublime Text 3")

    visit "/"
    click_link "Sublime Text 3"
    click_link "Delete Property"

    expect(page).to have_content("Property has been deleted.")

    visit "/"

    expect(page).to have_no_content("Sublime Text 3")
  end
end
