require 'bcrypt'

FactoryBot.define do
  factory :user do
    primary_user_email
    user_emails(count: 1)
    encrypted_password { ::BCrypt::Password.create("password", cost: 10).to_s}
  end


end