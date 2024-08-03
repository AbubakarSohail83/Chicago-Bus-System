FactoryBot.define do
  factory :bus_stop do
    stop_id { Faker::Number.unique.number(digits: 5) }
    on_street { Faker::Address.street_name }
    cross_street { Faker::Address.street_name }
    routes { Faker::Lorem.words(number: 3).join(', ') }
    boardings { Faker::Number.decimal(l_digits: 2) }
    alightings { Faker::Number.decimal(l_digits: 2) }
    month_beginning { Faker::Date.backward(days: 365).strftime("%Y-%m-%d") }
    daytype { %w[Weekday Saturday Sunday].sample }
    location { { latitude: Faker::Address.latitude, longitude: Faker::Address.longitude } }
  end
end
