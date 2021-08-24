#models sao classes usadas para representar dados elas podem interagir com o db pelo Active record
class Article < ApplicationRecord
    has_many :comments

    validates :title, presence: true
    validates :body, presence: true, length: {minimum: 10}
end
