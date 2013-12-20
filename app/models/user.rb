#This reuire is to support the encryp/decrypt passwords like in INNOVA
require Rails.root.join('lib', 'devise', 'encryptors', 'md5')


class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :encryptable 
  attr_accessible :name, :email, :password, :remember_me, :admin, :tester, :developer

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false


  #The follow functions are to support the encryp/decrypt passwords like in INNOVA
  def password_salt
    'Th1s Jus7 50m3 3ncRypti0n k@ys'
  end

  def password_salt=(new_salt)
  end

end
