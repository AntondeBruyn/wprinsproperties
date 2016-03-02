require "rails_helper"

RSpec.feature "Viewing galleries" do
  before do
    sublime = FactoryGirl.create(:property, name: "Property name")

    FactoryGirl.create(:gallery,
      property: sublime,
      name: "Mooiplaas")

    property_2 = FactoryGirl.create(:property, name: "Second property")
    FactoryGirl.create(:gallery,
      property: property_2,
      name: "Vergelegen")

    visit "/"
  end

  scenario "for a given property" do
    click_link "Property name"

    expect(page).to have_content("Mooiplaas")
    expect(page).to_not have_content("Vergelegen")

    click_link "Mooiplaas"
      within("#gallery h2") do
    expect(page).to have_content("Mooiplaas")
    end
  end
end
