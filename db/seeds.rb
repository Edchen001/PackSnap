xiran = User.create(username: "xiran", email: "xiran@dbc.com", password: 123, password_confirmation: 123)


blazing = Category.create(name:"blazing")
hot = Category.create(name:"hot")
warm = Category.create(name:"warm")
cool = Category.create(name:"cool")
cold = Category.create(name:"cold")
freezing = Category.create(name:"freezing")

blazing.scope = Scope.create(minimum: 100, maximum: 130)
hot.scope = Scope.create(minimum:85, maximum:99)
warm.scope = Scope.create(minimum:70, maximum:84)
cool.scope = Scope.create(minimum:50, maximum:69)
cold.scope = Scope.create(minimum: 33, maximum:49)
freezing.scope = Scope.create(minimum: -30, maximum:32)

jean_image = Photo.create!(image: File.open('app/assets/images/jean_image.jpg'))
snowjacket_image = Photo.create!(image: File.open('app/assets/images/snow_jacket.jpg'))
sunglasses_image = Photo.create!(image: File.open('app/assets/images/sun_glasses.jpg'))
sunhat_image = Photo.create!(image: File.open('app/assets/images/sun_hat.jpg'))

jean = Item.create!(name: "jean", url:"www.jean.com", photo: jean_image)
snowjacket = Item.create!(name:"snowjacket", url:"snowjacket.com", photo: snowjacket_image)
sunglasses = Item.create!(name:"sunglasses", url:"sun_glasses.com", photo: sunglasses_image)
sunhat = Item.create!(name:"sunhat", url:"sunhat.com", photo: sunhat_image)

Suggestion.create(item: jean, category: cool)
Suggestion.create(item: jean, category: warm)
Suggestion.create(item: jean, category: cold)

Suggestion.create(item: snowjacket, category: cold)
Suggestion.create(item: snowjacket, category: freezing)

Suggestion.create(item: sunglasses, category: hot)
Suggestion.create(item: sunglasses, category: warm)
Suggestion.create(item: sunglasses, category: cool)
Suggestion.create(item: sunglasses, category: cold)
Suggestion.create(item: sunglasses, category: freezing)
Suggestion.create(item: sunglasses, category: blazing)

Suggestion.create(item: sunhat, category: blazing)
Suggestion.create(item: sunhat, category: hot)

