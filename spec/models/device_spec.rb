require 'spec_helper'


describe Device do

  shared_examples "have transition" do |transition_name_method, from, to|
    describe "##{transition_name_method}" do
      it "should have transition from #{from} to #{to}" do
        subject.status = from
        expect{subject.send( (transition_name_method + "?").to_sym)}.to be_true
        expect{subject.send( (transition_name_method + "!").to_sym)}.to change(subject, :status).from(from).to(to)
      end
    end
  end


  before { @device = FactoryGirl.build(:device) }
  subject { @device }
  #=========================== attributes ===================================================#
  [:type_device, :so, :version, :no_serie, :id_inventario, :udid, :description, :color, :status, :start_using, :user_id, :project_id].each do |attr|
    it { should respond_to(attr) }
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

  #=========================== state machine ===================================================#

  describe "state machine" do
    before do 
      subject.user = FactoryGirl.create(:user) 
      subject.project = FactoryGirl.create(:project) 
      subject.start_using = Time.now
    end
    it 'initial state should be available' do
      should be_available
    end
    
    it_should_behave_like "have transition", "mark_as_unavailable", "AVAILABLE", "UNAVAILABLE"
    it_should_behave_like "have transition", "mark_as_failing", "AVAILABLE", "FAILING"
    it_should_behave_like "have transition", "mark_as_available", "UNAVAILABLE", "AVAILABLE"
    it_should_behave_like "have transition", "mark_as_available", "FAILING", "AVAILABLE"
  end

  #=========================== validations =====================================================#

  context 'validations' do
    describe 'type_device' do 
      describe 'when is blank' do
        before { subject.type_device = '' }
        it "should be invalid" do
          expect(subject).not_to be_valid
        end
      end
 
      describe "when doesn't have the right type of device" do
        it "should be invalid" do
          wrong_types = %w(wrong_type other_wrong)
          wrong_types.each do |wrong_type|
            subject.type_device = wrong_type
            expect(subject).not_to be_valid
          end
        end
      end

      describe "when have the right type of device" do
        it "should be valid" do
          Device::TYPES.each do |right_type|
            subject.type_device = right_type
            expect(subject).to be_valid
          end
        end
      end
    end 

    describe 'so' do
      describe 'when is blank' do
        before { subject.so = ''}
        it "should be invalid" do
          expect(subject).not_to be_valid
        end
      end
      describe "when doesn't have the right so" do
        it "should be invalid" do
          wrong_so = %w(wrong_soe other_so)
          wrong_so.each do |wrong_so|
            subject.so = wrong_so
            expect(subject).not_to be_valid
          end
        end
      end

      describe "when have the right so of device" do
        it "should be valid" do
          Device::SOS.each do |right_so|
            subject.so = right_so
            expect(subject).to be_valid
          end
        end
      end
    end

    describe 'version' do
      describe 'when is blank' do
        before { subject.version = '' }
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    describe 'no_serie' do
      describe 'when is blank' do
        before { subject.no_serie = '' }
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end

      describe "when has already been taken" do
        before do
          device_with_same_no_serie = subject.dup
          device_with_same_no_serie.save!
        end
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    describe 'id_inventario' do
      describe 'when is blank' do
        before { subject.id_inventario = '' }
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end

      describe "when has already been taken" do
        before do
          device_with_same_id_inventario = subject.dup
          device_with_same_id_inventario.save!
        end
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    describe 'udid' do
      describe 'when is blank' do
        before { subject.udid = '' }
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end

      describe "when has already been taken" do
        before do
          device_with_same_udid = subject.dup
          device_with_same_udid.save!
        end
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end
    end

    describe 'description' do
      describe 'when is blank' do
        before { subject.description = '' }
        it 'should be invalid' do
          expect(subject).not_to be_valid
        end
      end
    end
  end
end
