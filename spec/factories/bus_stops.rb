FactoryBot.define do
  factory :bus_stop do
    stop_id { Faker::Number.unique.number(digits: 4) }
    on_street { Faker::Address.street_name }
    cross_street { Faker::Address.street_name }
    routes { Faker::Lorem.words(number: rand(1..5)) }
    boardings { Faker::Number.number(digits: 2) }
    alightings { Faker::Number.number(digits: 2) }
  end
end
