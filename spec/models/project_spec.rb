require 'spec_helper'

describe Project do
  before { @project = FactoryGirl.build(:project)}
  subject { @project }

  #=========================== attributes ===================================================#
  [:name, :customer, :key].each do |attr|
    it { should respond_to(attr) }
  end

  it "Should be valid" do
    expect(subject).to be_valid
  end

  context "validations" do
    describe "name" do
      describe "when is blank" do
        before { subject.name = "" }
        it "should be invalid" do
          expect(subject).not_to be_valid
        end
      end
    end

    describe "customer" do
      describe "when is blank" do
        before { subject.customer = "" }
        it "should be invalid" do
          expect(subject).not_to be_valid
        end
      end
    end

  end
end
