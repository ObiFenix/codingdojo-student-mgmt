require 'rails_helper'

RSpec.describe "dojos/new", type: :view do
  before(:each) do
    assign(:dojo, Dojo.new(
      :branch => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString"
    ))
  end

  it "renders new dojo form" do
    render

    assert_select "form[action=?][method=?]", dojos_path, "post" do

      assert_select "input[name=?]", "dojo[branch]"

      assert_select "input[name=?]", "dojo[street]"

      assert_select "input[name=?]", "dojo[city]"

      assert_select "input[name=?]", "dojo[state]"
    end
  end
end
