# == Schema Information
#
# Table name: shortened_urls
#
#  id                                                              :bigint           not null, primary key
#  user_id                                                         :integer          not null
#  long_url                                                        :string           not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  short_url                                                       :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    random_code 
        short_url = urlsafe_base64(16)
    end

    
end
