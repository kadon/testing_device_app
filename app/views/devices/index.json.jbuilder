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
  json.user device.user_name
  json.project device.project_name
  json.start_using  device.start_using ? time_ago_in_words(device.start_using) : ""
  json.take_cable device.take_cable
end
