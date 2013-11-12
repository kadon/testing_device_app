class Device < ActiveRecord::Base
  SOS = %w(Android iOS)
  TYPES = %w(SmartPhone Tablet)
  STATUSES = %w(AVAILABLE UNAVAILABLE FAILING)
  
  attr_accessible :color, :description, :id_inventario, :no_serie, :so, :type_device, :udid, :version, :status, :start_using, :user_id, :project_id

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

  #Callbacks
  before_save :clean_using_information
 
  #Instance methods

  state_machine :status, :initial => :AVAILABLE do
    event :mark_as_unavailable do
      transition :AVAILABLE => :UNAVAILABLE
    end

    event :mark_as_failing do
      transition :AVAILABLE => :FAILING
    end

    event :mark_as_available do
      transition [:UNAVAILABLE, :FAILING] => :AVAILABLE
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
  
  STATUSES.each do |status_name|
    define_method "#{status_name.downcase}?" do
      status == status_name
    end
  end

  #private methods
  private
  def clean_using_information
    user = nil
    project = nil
    start_using = nil
  end

end
