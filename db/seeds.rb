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

jean_image = Photo.create!(image: File.open('app/assets/images/jean_image.jpg'))
snowjacket_image = Photo.create!(image: File.open('app/assets/images/snow_jacket.jpg'))
sunglasses_image = Photo.create!(image: File.open('app/assets/images/sunglasses.jpg'))
sunhat_image = Photo.create!(image: File.open('app/assets/images/sun_hat.jpg'))
sandals_image = Photo.create!(image: File.open('app/assets/images/sandals.jpg'))
lw_sweater_image = Photo.create!(image: File.open('app/assets/images/lw_sweater.jpg'))
lw_scarf_image = Photo.create!(image: File.open('app/assets/images/lw_scarf.jpg'))
warm_scarf_image = Photo.create!(image: File.open('app/assets/images/warm_scarf.jpg'))
warm_hat_image = Photo.create!(image: File.open('app/assets/images/warm_hat.jpg'))
thick_socks_image = Photo.create!(image: File.open('app/assets/images/thick_socks.jpg'))


jeans = Item.create!(name: "jeans", url:"www.jeans.com", photo: jean_image)
snowjacket = Item.create!(name:"snowjacket", url:"snowjacket.com", photo: snowjacket_image)
sunglasses = Item.create!(name:"sunglasses", url:"sun_glasses.com", photo: sunglasses_image)
sandals = Item.create!(name:"sandals", url:"sandals.com", photo: sandals_image)
sun_hat = Item.create!(name:"sun hat", url:"sunhat.com", photo: sunhat_image)
lw_sweater = Item.create!(name:"lightweight sweater", url:"lwsweater.com", photo: lw_sweater_image)
lw_scarf = Item.create!(name:"lightweight scarf", url:"lwscarf.com", photo: lw_scarf_image)
warm_scarf = Item.create!(name:"warm scarf", url:"warmscarf.com", photo: warm_scarf_image)
warm_hat = Item.create!(name:"warm hat", url:"warmhat.com", photo: warm_hat_image)
thick_socks = Item.create!(name:"thick socks", url:"thicksocks.com", photo: thick_socks_image)

Suggestion.create(item: jeans, category: cool)
Suggestion.create(item: jeans, category: warm)
Suggestion.create(item: jeans, category: cold)

Suggestion.create(item: snowjacket, category: cold)
Suggestion.create(item: snowjacket, category: freezing)
Suggestion.create(item: snowjacket, category: snow)

Suggestion.create(item: sunglasses, category: hot)
Suggestion.create(item: sunglasses, category: warm)
Suggestion.create(item: sunglasses, category: cool)
Suggestion.create(item: sunglasses, category: cold)
Suggestion.create(item: sunglasses, category: freezing)
Suggestion.create(item: sunglasses, category: blazing)

Suggestion.create(item: sun_hat, category: blazing)
Suggestion.create(item: sun_hat, category: hot)


Suggestion.create(item: sandals, category: blazing)
Suggestion.create(item: sandals, category: hot)
Suggestion.create(item: sandals, category: warm)

Suggestion.create(item: lw_scarf, category: warm)
Suggestion.create(item: lw_scarf, category: cool)

Suggestion.create(item: lw_sweater, category: warm)
Suggestion.create(item: lw_sweater, category: cool)

Suggestion.create(item: warm_scarf, category: cold)
Suggestion.create(item: warm_scarf, category: freezing)

Suggestion.create(item: warm_hat, category: cold)
Suggestion.create(item: warm_hat, category: freezing)

Suggestion.create(item: thick_socks, category: cold)
Suggestion.create(item: thick_socks, category: freezing)
