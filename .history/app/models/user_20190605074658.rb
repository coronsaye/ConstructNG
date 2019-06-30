class User < ApplicationRecord
    has_and_belongs_to_many :roles
    has_many :companies
    has_many :individuals
end
