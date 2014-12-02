xiran = User.create(username: "xiran", email: "xiran@dbc.com", password: 123, password_confirmation: 123)


blazing = Category.create(name:"blazing")
hot = Category.create(name:"hot")
warm = Category.create(name:"warm")
cool = Category.create(name:"cool")
cold = Category.create(name:"cold")
freezing = Category.create(name:"freezing")
rain = Category.create(name:"rain")
snow = Category.create(name:"snow")
sleet = Category.create(name:"sleet")
hail = Category.create(name:"hail")

blazing.scope = Scope.create(minimum: 100, maximum: 130)
hot.scope = Scope.create(minimum:85, maximum:99)
warm.scope = Scope.create(minimum:70, maximum:84)
cool.scope = Scope.create(minimum:50, maximum:69)
cold.scope = Scope.create(minimum: 33, maximum:49)
freezing.scope = Scope.create(minimum: -30, maximum:32)

jean = Item.create!(name: "jean", image: File.open('app/assets/images/jean_image.jpg'))
snowjacket = Item.create!(name:"snowjacket", image: File.open('app/assets/images/snow_jacket.jpg'))
sunglasses = Item.create!(name:"sunglasses", image: File.open('app/assets/images/sun_glasses.jpg'))
sunhat = Item.create!(name:"sunhat", image: File.open('app/assets/images/sun_hat.jpg'))

# Suggestion.create(item: jean, category: cool)
# Suggestion.create(item: jean, category: warm)
# Suggestion.create(item: jean, category: cold)

# Suggestion.create(item: snowjacket, category: cold)
# Suggestion.create(item: snowjacket, category: freezing)
# Suggestion.create(item: snowjacket, category: snow)

# Suggestion.create(item: sunglasses, category: hot)
# Suggestion.create(item: sunglasses, category: warm)
# Suggestion.create(item: sunglasses, category: cool)
# Suggestion.create(item: sunglasses, category: cold)
# Suggestion.create(item: sunglasses, category: freezing)
# Suggestion.create(item: sunglasses, category: blazing)

# Suggestion.create(item: sunhat, category: blazing)
# Suggestion.create(item: sunhat, category: hot)

