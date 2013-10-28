require 'spec_helper'

describe Device do
  before { @device = FactoryGirl.build(:device) }
  subject { @device }
  #=========================== attributes ===================================================#
  [:type_device, :so, :version, :no_serie, :id_inventario, :udid, :description, :color, :status].each do |attr|
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

    describe 'statuses' do 
      describe 'when is blank' do
        before { subject.status = '' }
        it "should be invalid" do
          expect(subject).not_to be_valid
        end
      end
 
      describe "when doesn't have the right status" do
        it "should be invalid" do
          wrong_statuses = %w(wrong_status other_wrong)
          wrong_statuses.each do |wrong_status|
            subject.status = wrong_status
            expect(subject).not_to be_valid
          end
        end
      end

      describe "when have the right status" do
        it "should be valid" do
          Device::STATUSES.each do |right_status|
            subject.status = right_status
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
