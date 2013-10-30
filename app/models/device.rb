class Device < ActiveRecord::Base
  SOS = %w(Android iOS)
  TYPES = %w(SmartPhone Tablet)
  STATUSES = %w(AVAILABLE UNAVAILABLE FAILING)
  
  attr_accessible :color, :description, :id_inventario, :no_serie, :so, :type_device, :udid, :version, :status
  attr_readonly :s

  #Validations
  validates :description, :type_device, :version, presence: true
  validates :type_device, presence: true, inclusion: {in: TYPES, message: '%{value} is not a valid Type of device'}
  validates :so, presence: true, inclusion: {in: SOS, message: '%{value} is not a valid SO'}
  validates :status, presence: true, inclusion: {in: STATUSES, message: '%{value} is not a valid STAUS'}
  validates :id_inventario, presence: true, uniqueness: true
  validates :no_serie, presence: true, uniqueness: true
  validates :udid, presence: true, uniqueness: true

  #Callbacks
 
  #Instance methods
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

end
