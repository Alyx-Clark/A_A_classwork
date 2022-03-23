# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    validates :birth_date, :color, :name, :sex, :description, presence: true
    validates :color, inclusion: { in: %w(blue red green), message: "%{value} is not a valid color" }
    validates :sex, inclusion: { in: %w(M F), message: "%{value} is not a valid sex" }

    def age
        dob = self.birth_date
        now = Time.now.utc.to_date
        now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
      end
end
