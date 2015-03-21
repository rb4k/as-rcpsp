require 'spec_helper'

describe ProcedureResource do

  before do
    @procedureresource = ProcedureResource.new(procedure_id: 1, resource_id: 1, capa_demand: 8)
  end

  subject { @procedureresource }


  it { should respond_to(:capa_demand) }

#  it { should be_valid }


  describe "when capa_demand is non-positive" do
    before { @procedureresource.capa_demand = -2.0 }
    it { should_not be_valid }
  end


end