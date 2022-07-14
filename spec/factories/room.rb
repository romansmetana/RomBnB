FactoryBot.define do
  factory :room do
    name { 'For two person' }
    price { '130.60' }
    square { '40' }
    capacity { '2' }
    count { '7' }
    double_bed { '' }
    single_bed { '2' }
    hotel_id { '' }
  end
end
