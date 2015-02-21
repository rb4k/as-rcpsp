require 'spec_helper'

describe "procedures/show" do
  before(:each) do
    @procedure = assign(:procedure, stub_model(Procedure,
      :name => "Name",
      :kapabe => "Kapabe",
      :prot => "Prot"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Kapabe/)
    rendered.should match(/Prot/)
  end
end
