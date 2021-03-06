require 'faker'

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture do |f|
    association :album, factory: :album
    association :user, factory: :user

    #asset { fixture_file_upload "#{Rails.root}/spec/images/rails.png", 'image/png' }
    asset File.new("#{Rails.root}/spec/images/rails.png")

    f.caption { Faker::Lorem.sentence }
    f.description { Faker::Lorem.characters }

    # In case of `Errno::EMFILE: Too many open files`
    # after_create do |asset, proxy|
    #   proxy.file.close
    # end
  end
end
