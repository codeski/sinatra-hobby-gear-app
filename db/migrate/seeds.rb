todd = User.create(name: "Todd", email: "tstoneberg@todd.com", password: "yo")
User.create(name: "")

Hobby.create(name: "skiing", season: "winter", user_id: todd.id)
