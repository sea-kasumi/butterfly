class Health < ApplicationRecord
    has_many :symptoms
    belongs_to :user
end
