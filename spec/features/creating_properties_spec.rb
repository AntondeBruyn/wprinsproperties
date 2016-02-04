require "rails_helper"

RSpec.feature "Creating Properties" do
  before do
    visit "/"

    click_link "New Property"
  end

  scenario "A user can create a new property" do
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor for everyone"
    click_button "Create Property"

    expect(page).to have_content("Property has been created.")

    property = Property.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eql(property_url(property))

    title = "Sublime Text 3 - Properties - W Prins Properties"
    expect(page).to have_title("W Prins Properties")
  end

  scenario "A user cannot create a property without a name" do
    click_button "Create Property"

    expect(page).to have_content("Property has not been created.")
    expect(page).to have_content("Name can't be blank")
  end
end
