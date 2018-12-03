class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  email_regex = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  validates :email, :presence => true, :uniqueness => true, :format => email_regex
  validates :password, format: { with: /(?=.*?[0-9])(?=.*?[A-Za-z]).+/,
      message: "Password must contain at least one digit and one letter" }, length: { in: 6..10 }, on: :create

  validates :password, format: { with: /(?=.*?[0-9])(?=.*?[A-Za-z]).+/,
          message: "Password must contain at least one digit and one letter" }, length: { in: 6..10 }, on: :update, if: :password_digest_changed?

  has_secure_password

  enum role: [:standard, :admin]
  require 'carrierwave'
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, ImageUploader

  after_initialize do
  if self.new_record?
    self.role ||= :standard
  end
end

  def self.full_name
    full_name = [@user.first_name, @user.last_name].join(" ")
    full_name_reverse = [@user.first_name, @user.last_name].reverse.join(" ")
  end

  def self.age
    age = ((Time.zone.now - @user.birth_date.to_time) / 1.year.seconds).floor
  end

  def self.happy_birthday

  end
end
