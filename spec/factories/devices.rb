# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :device do
    type_device "Tablet"
    so "Android"
    version "2.4.5"
    no_serie "097858774YGG"
    id_inventario "9909"
    udid "88898895804"
    description "Tablet Android ss"
    color "Black"
    status Device::STATUSES[0]
  end
end
