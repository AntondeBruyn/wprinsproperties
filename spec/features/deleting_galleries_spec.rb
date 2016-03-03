require "rails_helper"

RSpec.feature "Deleting galleries" do
  let!(:property) { FactoryGirl.create(:property) }
  let!(:gallery) { FactoryGirl.create(:gallery, property: property) }

  before do
    visit property_gallery_path(property, gallery)
  end

  scenario "deleting successfully" do
    click_link "Delete Gallery"

    expect(page).to have_content("Gallery has been deleted.")
    expect(page.current_url).to eq(property_url(property))
  end
end
