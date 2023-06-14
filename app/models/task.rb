class Task < ApplicationRecord
    validates :description, presence: true, length: { minimum: 5 }
end
