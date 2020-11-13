class Counseling < ApplicationRecord
  belongs_to :hour
  belongs_to :user
  belongs_to :counsel
end
