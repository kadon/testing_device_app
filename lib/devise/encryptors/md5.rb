#This module is to change the way to encrypt decrypt the password and we can use the users and passwords fron innova
require 'digest/md5'

module Devise
  module Encryptable
    module Encryptors
      class Md5 < Base
        def self.digest(password, stretches, salt, pepper)
          Digest::MD5.hexdigest( Digest::MD5.hexdigest(salt) + Digest::MD5.hexdigest(password) )
        end
      end
    end
  end
end
