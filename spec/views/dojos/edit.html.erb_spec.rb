require 'rails_helper'

RSpec.describe "dojos/edit", type: :view do
  before(:each) do
    @dojo = assign(:dojo, Dojo.create!(
      :branch => "MyString",
      :street => "MyString",
      :city => "MyString",
      :state => "MyString"
    ))
  end

  it "renders the edit dojo form" do
    render

    assert_select "form[action=?][method=?]", dojo_path(@dojo), "post" do

      assert_select "input[name=?]", "dojo[branch]"

      assert_select "input[name=?]", "dojo[street]"

      assert_select "input[name=?]", "dojo[city]"

      assert_select "input[name=?]", "dojo[state]"
    end
  end
end
