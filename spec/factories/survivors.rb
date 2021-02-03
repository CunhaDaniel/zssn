FactoryBot.define do
  factory :survivor do
    name { FFaker::Name.name }
    age { 45 }
    gender { FFaker::Name.name }
  end
end
