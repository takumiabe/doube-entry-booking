FactoryBot.define do
  factory :account do
    name { "MyString" }
    xacttype { Account.xacttypes.keys.sample }
  end
end
