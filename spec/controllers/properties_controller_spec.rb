require 'rails_helper'

RSpec.describe PropertiesController, :type => :controller do
  it "displays an error for a missing property" do
    get :show, id: "not-here"

    expect(response).to redirect_to(properties_path)

    message = "The property you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
end
