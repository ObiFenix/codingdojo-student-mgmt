FactoryBot.define do
  factory :student do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    dojo_id { 1 }
    manager_id { 1 }
  end
end
