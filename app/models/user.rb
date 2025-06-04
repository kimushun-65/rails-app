class User < ApplicationRecord
    has_secure_password

    validates :name, presence: true, uniqueness: true, length: { maximum: 30 }, format: { with: /\A[a-z0-9]+\z/ , message: "は小文字英数字で入力してください"}
    validates :password, presence: true, length: { minimum: 8 }

    def age
        now = Time.zone.now
        (now.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
    end
end
