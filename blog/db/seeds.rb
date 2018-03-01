User.create!([
  {email: "nick.terry@gmail.com", encrypted_password: "$2a$11$r3pxxFVQVd0LyvL7dqc5IOdqA6T7LWxfj5dYX62O7Q8Pdg/swgxly", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 8, current_sign_in_at: "2018-03-01 20:24:20", last_sign_in_at: "2018-03-01 20:23:24", current_sign_in_ip: "172.17.0.1", last_sign_in_ip: "172.17.0.1", admin: nil},
  {email: "drew.terry@skookum.com", encrypted_password: "$2a$11$8bg80Xxgmt.hcNeNTA2KeeTCSZwbxU9edhW5sJVAQ3u1l/xEV1QYy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2018-03-01 20:24:04", last_sign_in_at: "2018-03-01 20:23:54", current_sign_in_ip: "172.17.0.1", last_sign_in_ip: "172.17.0.1", admin: nil}
])
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
