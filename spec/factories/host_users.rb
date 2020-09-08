FactoryBot.define do
  factory :host_user do
    nickname                        {Faker::Name.initials(number: 5)}
    hostname                        {"名字名前"}
    hostname_kana                   {"フリガナ"}
    phone                           {Faker::Number.number(digits:11)}
    age                             {"39"}
    gender                          {Faker::Gender.type}
    email                           {Faker::Internet.free_email}
    password                        {Faker::Internet.password(min_length: 6)}
    password_confirmation           { password }
  end
end
