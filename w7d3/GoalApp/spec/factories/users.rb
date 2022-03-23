FactoryBot.define do
  factory :user do
    username { "Faker::TvShows::TheFreshPrinceOfBelAir.character" }
    password { "password" }

    factory :will do
      username { "Will Smith" }
    end
  end
end
