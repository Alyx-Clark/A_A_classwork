class Sub < ApplicationRecord

    validates :description, :user_id, presence: true
    validates :title, presence: true, uniqueness: true

    belongs_to :moderator,
        foreign_key: :user_id,
        class_name: "User",
        primary_key: :id

        

end
