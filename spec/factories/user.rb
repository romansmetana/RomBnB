FactoryBot.define do
  factory :user do
    email { 'alexbro@gmail.com' }
    password { 'password' }
    first_name { 'Alex' }
    last_name { 'Duoling' }
    owner { 'false' }
  end
end
