class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  
  validate :error_check

    def error_check
        if answer.blank?
            errors[:base]<< '回答を入力してください'
        end
    end
  
  
end
