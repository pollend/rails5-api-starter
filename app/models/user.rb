require 'digest'
require 'bcrypt'
require 'active_support/security_utils'
class User < ActiveRecord::Base
  has_many :user_emails
  has_many :oauth2_user_infos, dependent: destroy


  belongs_to :primary_user_email, class_name: "UserEmail"
  validates :primary_user_email, presence: true

  def valid_password?(passowrd)
    return false if passowrd.blank?
    bcrypt = ::BCrypt::Password.new(encrypted_password)
    pass = ::BCrypt::Engine.hash_secret(passowrd,bcrypt.salt)
    ActiveSupport::SecurityUtils.secure_compare(pass,encrypted_password)
  end

  def password=(new_password)
    @password = new_password
    self.encrypted_password = ::BCrypt::Password.create(@password, cost: 10).to_s
  end

end

#create_table "users", force: :cascade do |t|
#  t.string   "encrypted_password",     default: "", null: false
#  t.string   "reset_password_token"
#  t.datetime "reset_password_sent_at"
#  t.datetime "remember_created_at"
#  t.integer  "sign_in_count",          default: 0,  null: false
#  t.datetime "current_sign_in_at"
#  t.datetime "last_sign_in_at"
#  t.inet     "current_sign_in_ip"
#  t.inet     "last_sign_in_ip"
#  t.integer  "primary_user_email_id"
#  t.index ["primary_user_email_id"], name: "index_users_on_primary_user_email_id", using: :btree
#  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
#end
