require 'rails_helper'

RSpec.describe "photos/show", :type => :view do
  before(:each) do
    @photo = assign(:photo, Photo.create!(
      :title => "Title",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Image/)
  end
end
