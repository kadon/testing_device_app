json.array! @projects do |project|
  json.id project.id
  json.name project.name
  json.customer project.customer
end
