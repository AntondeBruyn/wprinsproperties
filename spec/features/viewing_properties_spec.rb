require "rails_helper"

RSpec.feature "Viewing properties" do
  scenario "Listing all properties" do
    property = FactoryGirl.create(:property, name: "Sublime Text 3")
    visit "/"
    click_link "Sublime Text 3"
    expect(page.current_url).to eql(property_url(property))
  end
end
