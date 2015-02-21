require 'spec_helper'

describe "procedures/edit" do
  before(:each) do
    @procedure = assign(:procedure, stub_model(Procedure,
      :name => "MyString",
      :kapabe => "MyString",
      :prot => "MyString"
    ))
  end

  it "renders the edit procedure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procedures_path(@procedure), :method => "post" do
      assert_select "input#procedure_name", :name => "procedure[name]"
      assert_select "input#procedure_kapabe", :name => "procedure[kapabe]"
      assert_select "input#procedure_prot", :name => "procedure[prot]"
    end
  end
end
