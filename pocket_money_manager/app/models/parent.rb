class Parent < ApplicationRecord

  validates :first_name, :presence => true,
                         :length => { :maximum => 50 }
  validates :last_name,  :presence => true,
                         :length => { :maximum => 50 }
  validates :email,      :presence => true,
                         :uniqueness => true,
                         :length => { :maximum => 100 }
  validates :password,   :presence => true,
                         :length => { :maximum => 40 }

end
