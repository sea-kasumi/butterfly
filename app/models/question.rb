class Question < ApplicationRecord
    has_many :answers
    belongs_to :user
    
    validate :error_check

    def error_check
        if question.blank?
            errors[:base]<< '質問を入力しよう'
        end
    end
end
