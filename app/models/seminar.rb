class Seminar < ApplicationRecord
    belongs_to :subject
    belongs_to :user, foreign_key: 'teacher_id'  
end
