class Seminar < ApplicationRecord
    belongs_to :subject
    belongs_to :teacher, foreign_key: 'user_id'
    
end
