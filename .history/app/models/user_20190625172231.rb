class User < ApplicationRecord
    has_many :roles
    has_many :companies
    has_many :individuals
end
