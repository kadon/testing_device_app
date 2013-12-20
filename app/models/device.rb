class Device < ActiveRecord::Base
  SOS = %w(Android iOS BlackBerry)
  TYPES = %w(SmartPhone Tablet)
  STATUSES = %w(available unavailable failing)
  
  attr_accessible :color, :description, :id_inventario, :no_serie, :so, :type_device, :udid, :version, :status, :start_using, :user_id, :project_id, :take_cable

  #Associations
  belongs_to :user
  belongs_to :project 

  #Validations
  validates :description, :type_device, :version, presence: true
  validates :type_device, presence: true, inclusion: {in: TYPES, message: '%{value} is not a valid Type of device'}
  validates :so, presence: true, inclusion: {in: SOS, message: '%{value} is not a valid SO'}
  validates :status, presence: true, inclusion: {in: STATUSES, message: '%{value} is not a valid STAUS'}
  validates :id_inventario, presence: true, uniqueness: true
  validates :no_serie, presence: true, uniqueness: true
  validates :udid, presence: true, uniqueness: true
  validates :user, presence: true, if: :unavailable?
  validates :project, presence: true, if: :unavailable?
  validates :start_using, presence: true, if: :unavailable?

  #delegates
  delegate :name, :to => :user, :prefix => true, :allow_nil => true
  delegate :name, :to => :project, :prefix => true, :allow_nil => true

  #Instance methods

  state_machine :status, :initial => :available do

    before_transition :unavailable => any, :do => :clean_using_information
    before_transition :available => :failing, :do => :clean_using_information

    event :mark_as_unavailable do
      transition :available => :unavailable
    end

    event :mark_as_failing do
      transition :available => :failing
    end

    event :mark_as_available do
      transition [:unavailable, :failing] => :available
    end

    state :unavailable do
      validates_presence_of :user
    end
  end

  SOS.each do |so_name|
    define_method "#{so_name.downcase}?" do
      so == so_name
    end
  end

  TYPES.each do |type_name|
    define_method "#{type_name.downcase}?" do
      type == type_name
    end
  end

  #private methods
  private
  def clean_using_information
    self.user = nil
    self.project = nil
    self.start_using = nil
    self.take_cable  = nil
  end

end
