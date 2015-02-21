require 'spec_helper'

describe "procedures/index" do
  before(:each) do
    assign(:procedures, [
      stub_model(Procedure,
        :name => "Name",
        :kapabe => "Kapabe",
        :prot => "Prot"
      ),
      stub_model(Procedure,
        :name => "Name",
        :kapabe => "Kapabe",
        :prot => "Prot"
      )
    ])
  end

  it "renders a list of procedures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Kapabe".to_s, :count => 2
    assert_select "tr>td", :text => "Prot".to_s, :count => 2
  end
end
