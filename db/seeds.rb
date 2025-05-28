# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
if Rails.env == "development"
    (1..50).each do |i|
        Board.create(
            author_name: "テスト太郎#{i}",
            title: "テストタイトル#{i}",
            body: "テスト本文#{i}"
        )
    end
    Tag.create([
        {name: "Ruby"},
        {name: "Rails"},
        {name: "JavaScript"},
        {name: "HTML"},
        {name: "CSS"},
        {name: "SQL"},
        {name: "Git"},
        {name: "Docker"},
        {name: "AWS"},
    ])
end
