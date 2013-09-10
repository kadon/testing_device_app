class Device < ActiveRecord::Base
  SOS = %w(Android iOS)
  TYPES = %w(SmartPhone Tablet)

  attr_accessible :color, :description, :id_inventario, :no_serie, :so, :type_device, :udid, :version

  validates :description, :type_device, :version, presence: true
  validates :type_device, presence: true, inclusion: {in: TYPES, message: '%{value} is not a valid Type of device'}
  validates :so, presence: true, inclusion: {in: SOS, message: '%{value} is not a valid SO'}
  validates :id_inventario, presence: true, uniqueness: true
  validates :no_serie, presence: true, uniqueness: true
  validates :udid, presence: true, uniqueness: true

  #instance methods
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

end
