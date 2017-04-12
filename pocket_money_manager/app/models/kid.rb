class Kid < ApplicationRecord

  belongs_to :parent

  has_secure_password

  validates :name,     :presence => true,
                       :length => {:maximum => 25}
  validates :username, :presence => true,
                       :length => {:maximum => 50},
                       :uniqueness => true
  validates :password, :presence => true,
                       :length => {:maximum => 25}
end
