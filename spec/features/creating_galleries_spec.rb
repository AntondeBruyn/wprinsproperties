require "rails_helper"

RSpec.feature "Creating Galleries" do
  before do
    FactoryGirl.create(:property, name: "Internet Explorer")

    visit "/"
    click_link "Internet Explorer"
    click_link "New Gallery"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    click_button "Create Gallery"

    expect(page).to have_content("Gallery has been created.")
  end

  scenario "with missing fields" do
    click_button "Create Gallery"

    expect(page).to have_content("Gallery has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
