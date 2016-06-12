class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true, format: {without: /[\s@]/}

  attr_accessor :username_or_email

  def self.find_for_database_authentication(warden_conditions)
    username_or_email = warden_conditions[:username_or_email]
    find_by('username = ? OR email = ?', username_or_email, username_or_email)
  end
end
