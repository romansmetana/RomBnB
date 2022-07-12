FactoryBot.define do
  factory :hotel do
    name { 'Hilton' }
    address { 'Kotorská 1577/26' }
    description { 'The best hotel in Prague' }
    city { 'Praha' }
    user_id { '' }
  end
end
