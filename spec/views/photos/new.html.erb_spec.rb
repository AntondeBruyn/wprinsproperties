require 'rails_helper'

RSpec.describe "photos/new", :type => :view do
  before(:each) do
    assign(:photo, Photo.new(
      :title => "MyString",
      :image => "MyString"
    ))
  end

  it "renders new photo form" do
    render

    assert_select "form[action=?][method=?]", photos_path, "post" do

      assert_select "input#photo_title[name=?]", "photo[title]"

      assert_select "input#photo_image[name=?]", "photo[image]"
    end
  end
end
