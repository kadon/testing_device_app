json.array! @devices do |device|
  json.id device.id
  json.type_device device.type_device
  json.so device.so
  json.version device.version
  json.no_serie device.no_serie
  json.id_inventario device.id_inventario
  json.udid device.udid
  json.description device.description
  json.color device.color
  json.status device.status
end
