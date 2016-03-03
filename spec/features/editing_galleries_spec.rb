require "rails_helper"

RSpec.feature "Editing galleries" do
  let!(:property) { FactoryGirl.create(:property) }
  let!(:gallery) { FactoryGirl.create(:gallery, property: property) }

  before do
    visit property_gallery_path(property, gallery)
    click_link "Edit Gallery"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Make it really shiny!"
    click_button "Update Gallery"

    expect(page).to have_content "Gallery has been updated."

    within("#gallery h2") do
      expect(page).to have_content("Make it really shiny!")
    end

      expect(page).to_not have_content(gallery.name)
    end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Gallery"

    expect(page).to have_content("Gallery has not been updated.")
  end
end
