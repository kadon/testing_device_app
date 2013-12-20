require 'spec_helper'


describe Device do

  shared_examples "have transition" do |transition_name_method, from, to|
    describe "##{transition_name_method}" do
      it "should have transition from #{from} to #{to}" do
        expect{subject.send( (transition_name_method + "?").to_sym)}.to be_true
        expect{subject.send( (transition_name_method + "!").to_sym)}.to change(subject, :status).from(from).to(to)
      end
    end
  end


  before { @device = FactoryGirl.build(:device) }
  subject { @device }

  #========================= Attributes =========================#
  [:type_device, :so, :version, :no_serie, :id_inventario, :udid, :description, :color, :status, :start_using, :user_id, :project_id, :take_cable].each do |attr|
    it { should allow_mass_assignment_of(attr) }
  end

  it "Should be valid" do
    expect(subject).to be_valid
  end

  describe "SOS accessors" do
    Device::SOS.each do |so|
      it "should respond to #{so.downcase}?" do
        should respond_to("#{so.downcase}?")
      end
    end
  end

  describe "TYPES accessors" do
    Device::TYPES.each do |type|
      it "should respond to #{type.downcase}?" do
        should respond_to("#{type.downcase}?")
      end
    end
  end

  describe "STATUSES accessors" do
    Device::STATUSES.each do |status|
      it "should respond to #{status.downcase}?" do
        should respond_to("#{status.downcase}?")
      end
    end
  end

  #========================= Validations =========================#

  context 'validations' do
    describe 'type_device' do 
      it { should validate_presence_of(:type_device) }
      it { should ensure_inclusion_of(:type_device).in_array(Device::TYPES) }
    end 

    describe 'so' do
      it { should validate_presence_of(:so) }
      it { should ensure_inclusion_of(:so).in_array(Device::SOS) }
    end

    describe 'version' do
      it { should validate_presence_of(:version) }
    end

    describe 'no_serie' do
      it { should validate_presence_of(:no_serie) }
      it { should validate_uniqueness_of(:no_serie) }
    end

    describe 'id_inventario' do
      it { should validate_presence_of(:id_inventario) }
      it { should validate_uniqueness_of(:id_inventario) }
    end

    describe 'udid' do
      it { should validate_presence_of(:udid) }
      it { should validate_uniqueness_of(:udid) }
    end

    describe 'description' do
      it { should validate_presence_of(:description) }
    end
  end

  #========================= State Machine =========================#

  describe "state machine" do
    before do 
      subject.user = FactoryGirl.create(:user) 
      subject.project = FactoryGirl.create(:project) 
      subject.start_using = Time.now
    end

    it 'initial state should be available' do
      should be_available
    end
    
    it_should_behave_like "have transition", "mark_as_unavailable", "available", "unavailable" do
      before {subject.status = "available"}
    end

    it_should_behave_like "have transition", "mark_as_failing", "available", "failing" do
      before { subject.status = "available" }
      describe "after transition" do
        it "user, project and start_using attributes should be nil" do
          subject.mark_as_failing
          expect{subject.user.nil?}.to be_true
          expect{subject.take_cable.nil?}.to be_true
        end
      end
    end

    it_should_behave_like "have transition", "mark_as_available", "unavailable", "available" do
      before { subject.status = "unavailable" }
      describe "after transition" do
        it "user, project and start_using attributes should be nil" do
          subject.mark_as_available
          expect{subject.user.nil?}.to be_true
          expect{subject.take_cable.nil?}.to be_true
        end
      end

    end

    it_should_behave_like "have transition", "mark_as_available", "failing", "available" do
      before { subject.status = "failing" }
      describe "after transition" do
        it "user, project and start_using attributes should be nil" do
          subject.mark_as_available
          expect{subject.user.nil?}.to be_true
          expect{subject.take_cable.nil?}.to be_true
        end
      end

    end
  end

end
