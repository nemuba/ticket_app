# frozen_string_literal: true

require "rails_helper"

RSpec.describe "home/index.html.erb", type: :view do
  it "displays view home index" do
    render template: "home/index"
    expect(rendered).to match("Create yours tickets")
    expect(rendered).to match("See all")
  end
end
