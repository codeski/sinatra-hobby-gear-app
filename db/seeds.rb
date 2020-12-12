todd = User.create(name: "Todd", email: "todd@todd.com", password: "yo")
jill = User.create(name: "Jill", email: "jill@jill.com", password: "sup")

hobby1 = Hobby.create(name: "skiing", season: "winter", user_id: todd.id)
hobby2 = Hobby.create(name: "fishing", season: "summer", user_id: todd.id)

Item.create(name: "skis", year: 2005, company: "dps", hobby_id: hobby1.id)
Item.create(name: "boots", year: 2005, company: "dynafit", hobby_id: hobby1.id)
Item.create(name: "poles", year: 2005, company: "marker", hobby_id: hobby1.id)

Item.create(name: "pole", year: 2005, company: "ugly_stick", hobby_id: hobby2.id)
Item.create(name: "lure", year: 2005, company: "rapala", hobby_id: hobby2.id)

hobby3 = Hobby.create(name: "soccer", season: "spring", user_id: jill.id)
hobby4 = Hobby.create(name: "dancing", season: "all", user_id: jill.id)

Item.create(name: "kleets", year: 1996, company: "addidas", hobby_id: hobby3.id)
Item.create(name: "ball", year: 1990, company: "nike", hobby_id: hobby3.id)

Item.create(name: "shoes", year: 2019, company: "sketchers", hobby_id: hobby4.id)
