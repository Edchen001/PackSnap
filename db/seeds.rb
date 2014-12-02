xiran = User.create(username: "xiran", email: "xiran@dbc.com", password: 123, password_confirmation: 123)
viktor = User.create(username: "viktor", email: "viktor@dbc.com", password: 123, password_confirmation: 123)
baron = User.create(username: "baron", email: "baron@dbc.com", password: 123, password_confirmation: 123)
aj = User.create(username: "aj", email: "aj@dbc.com", password: 123, password_confirmation: 123)
ed = User.create(username: "ed", email: "ed@dbc.com", password: 123, password_confirmation: 123)



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

blazing.scope = Scope.create(minimum: 37.78, maximum: 54.44)
hot.scope = Scope.create(minimum:29.44, maximum:37.77)
warm.scope = Scope.create(minimum:21.11, maximum:29.44)
cool.scope = Scope.create(minimum:10, maximum:21.10)
cold.scope = Scope.create(minimum: 0.01, maximum:9.99)
freezing.scope = Scope.create(minimum: -34.44, maximum: 0.00)

jean = Item.create!(name: "jean",image: File.open('app/assets/images/jean_image.jpg'))
snowjacket = Item.create!(name: "snow jacket",image: File.open('app/assets/images/snow_jacket.jpg'))
sunglasses = Item.create!(name: "sunglasses",image: File.open('app/assets/images/sunglasses.jpg'))
sunhat = Item.create!(name: "sunhat",image: File.open('app/assets/images/sun_hat.jpg'))
sandals = Item.create!(name: "sandals",image: File.open('app/assets/images/sandals.jpg'))
lw_sweater = Item.create!(name: "lw sweater",image: File.open('app/assets/images/lw_sweater.jpg'))
lw_scarf = Item.create!(name: "lw scarf",image: File.open('app/assets/images/lw_scarf.jpg'))
warm_scarf = Item.create!(name: "warm scarf",image: File.open('app/assets/images/warm_scarf.jpg'))
warm_hat = Item.create!(name: "warm hat",image: File.open('app/assets/images/warm_hat.jpg'))
thick_socks = Item.create!(name: "thick socks",image: File.open('app/assets/images/thick_socks.jpg'))
thermal_underwear = Item.create!(name: "thermal socks",image: File.open('app/assets/images/thermal_underwear.jpg'))
umbrella = Item.create!(name: "umbrella",image: File.open('app/assets/images/umbrella.jpg'))
raincoat = Item.create!(name: "rain coat",image: File.open('app/assets/images/raincoat.jpg'))
windbreaker = Item.create!(name: "wind breaker",image: File.open('app/assets/images/windbreaker.jpg'))
firstaid = Item.create!(name: "wind breaker",image: File.open('app/assets/images/first_aid.jpg'))


Suggestion.create(item: jean, category: cool)
Suggestion.create(item: jean, category: warm)
Suggestion.create(item: jean, category: cold)

Suggestion.create(item: snowjacket, category: cold)
Suggestion.create(item: snowjacket, category: freezing)
Suggestion.create(item: snowjacket, category: snow)

Suggestion.create(item: sunglasses, category: hot)
Suggestion.create(item: sunglasses, category: warm)
Suggestion.create(item: sunglasses, category: cool)
Suggestion.create(item: sunglasses, category: cold)
Suggestion.create(item: sunglasses, category: freezing)
Suggestion.create(item: sunglasses, category: blazing)

Suggestion.create(item: sunhat, category: blazing)
Suggestion.create(item: sunhat, category: hot)

Suggestion.create(item: sandals, category: hot)
Suggestion.create(item: sandals, category: warm)

Suggestion.create(item: lw_sweater, category: cool)

Suggestion.create(item: lw_scarf, category: cool)

Suggestion.create(item: warm_scarf, category: cold)
Suggestion.create(item: warm_scarf, category: freezing)

Suggestion.create(item: warm_hat, category: cold)
Suggestion.create(item: warm_hat, category: freezing)

Suggestion.create(item: thick_socks, category: cold)
Suggestion.create(item: thick_socks, category: freezing)

Suggestion.create(item: thermal_underwear, category: freezing)

Suggestion.create(item: umbrella, category: rain)

Suggestion.create(item: raincoat, category: rain)

Suggestion.create(item: windbreaker, category: hail)

Suggestion.create(item: firstaid, category: hail)

