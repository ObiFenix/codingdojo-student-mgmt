class Dojo < ApplicationRecord
    has_many  :managers, :dependent => :destroy
    has_many  :students, :dependent => :destroy
    validates :street, :city, presence: true, length: { minimum: 2 }
    validates :branch, uniqueness: { case_sensitive: false }
end
