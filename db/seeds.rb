
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

jean = Item.create(name: "jean", url:"www.jean.com", photo: File.open('app/assets/images/jean_image.jpg', 'rb'))

snowjacket = Item.create(name:"snowjacket", url:"snowjacket.com", photo: File.open('app/assets/images/snow_jacket.jpg', 'rb'))
sunglasses = Item.create(name:"sunglasses", url:"sun_glasses.com", photo: File.open('app/assets/images/sun_glasses.jpg', 'rb'))
sunhat = Item.create(name:"sunhat", url:"sunhat.com", photo: File.open('app/assets/images/sun_hat.jpg', 'rb'))


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

