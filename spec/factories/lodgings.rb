FactoryBot.define do
  factory :lodging do
    lodge_name { Faker::Name.initials(number: 5)}
    price      { 3000 }
    postcode   {'102-3456'}
    prefecture_id { 1 }
    city {'新宿区'}
    block_number {'新宿1-1-1'}
    building {'新宿ビル'}
    images { [Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/test_image.jpeg'), 'app/assets/images/test_image.jpeg')]} # 画像はjson型なので[]で画像データを囲む必要がある。
    association :host_user
  end
end
