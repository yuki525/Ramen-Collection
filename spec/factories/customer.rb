FactoryBot.define do 
    factory :customer do 
        name {"hiro"}
        sequence(:email) { |n| "hiro#{n}@example.com"}
        password {"password"}
    end 
end 