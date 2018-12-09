class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  attr_accessor :full_name, :age, :total_posts, :birthdays_this_month

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
    [self.first_name, self.last_name].join(" ") if !self.first_name.blank? && !self.last_name.blank?
  end

  def age
    ((Time.now - self.birth_date.to_time) / 1.year.seconds).floor
  end

  def total_posts
    self.posts.size
  end

  def birthday_today?
    return nil unless self.birth_date?
    Date.today.strftime('%m%d') == self.birth_date.strftime('%m%d')
  end

  def self.birthdays_this_month
    User.where("cast(strftime('%m', birth_date) as int) = ?", Date.today.month).limit(10).order(Arel.sql('date(birth_date)'))
  end

  def self.birthdays_today
    User.where("strftime('%m%d', birth_date) = ?", Date.today.strftime('%m%d'))
  end
end
