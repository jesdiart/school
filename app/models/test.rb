class Test < ApplicationRecord
  belongs_to :subject
  has_many :results
end
