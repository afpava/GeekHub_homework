class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  attr_accessor :full_name, :age, :happy_birthday

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

  def full_name
    [self.first_name, self.last_name].join(" ")
    #self.full_name_reverse = [self.first_name, self.last_name].reverse.join(" ")
  end

  def age
    ((Time.zone.now - self.birth_date.to_time) / 1.year.seconds).floor
  end

  def happy_birthday
        year = Date.today.year
        mmdd = self.birth_date.to_time.strftime('%m%d')
        year += 1 if mmdd < Date.today.strftime('%m%d')
        mmdd = '0301' if mmdd == '0229' && !Date.parse("#{year}0101").leap?
        #return Date.parse("#{year}#{mmdd}")
        puts 1
  end
end
