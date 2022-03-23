class ArtworkShare < ApplicationRecord
    validates :viewer_id, :artwork_id, presence: true, uniqueness: true
    
    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork



end