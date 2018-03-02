Article.create!([
  {title: "Drew is ", text: "an awesome intern"},
  {title: "testing form", text: "reusability is awesome!"},
  {title: "New Postman Blog Entry", text: "This is a blog entry created via the Blog API."},
  {title: "Updated Postman Blog Entry", text: "This is a blog entry updated via the Blog API."}
])

Comment.create!([
  {commenter: "Drew", body: "yea he is!", article_id: 1},
  {commenter: "Postman", body: "Testing new comment.", article_id: 2},
  {commenter: "Postman", body: "Testing new comment.", article_id: 1},
  {commenter: "nick.terry@gmail.com", body: "but seriously.", article_id: 1}
])

User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |admin|
  admin.password = Rails.application.secrets.admin_password
  admin.password_confirmation = Rails.application.secrets.admin_password
  admin.admin = true
  admin.save
end
