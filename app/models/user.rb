class User < ApplicationRecord
    has_many :questions
    has_many :answers
    has_many :healths
    has_many :counselings
end
