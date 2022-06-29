FactoryBot.define do
    factory :user do
      email { Faker::Internet.email }
      password { Faker::Internet.password }
      first_name { 'Alex' }
      last_name { 'Duoling' }
    end
  end