class Answer < ApplicationRecord
  validates :body, null: false

  belongs_to :question  
end
