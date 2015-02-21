require 'spec_helper'

describe "procedures/new" do
  before(:each) do
    assign(:procedure, stub_model(Procedure,
      :name => "MyString",
      :kapabe => "MyString",
      :prot => "MyString"
    ).as_new_record)
  end

  it "renders new procedure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => procedures_path, :method => "post" do
      assert_select "input#procedure_name", :name => "procedure[name]"
      assert_select "input#procedure_kapabe", :name => "procedure[kapabe]"
      assert_select "input#procedure_prot", :name => "procedure[prot]"
    end
  end
end
