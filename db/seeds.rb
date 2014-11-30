hot = Category.create(name:"Hot")
comfortable = Category.create(name:"Comfortable")
cold = Category.create(name:"Cold")

hot.scope = Scope.create(minimum:85, maximum:99)
comfortable.scope = Scope.create(minimum:70, maximum:85)
cold.scope = Scope.create(minimum:50, maximum:70)


jean = Item.create(name:"jean", url:"jean.com")
snowjacket = Item.create(name:"snowjacket", url:"snowjacket.com")
sunglasses = Item.create(name:"sunglasses", url:"sunglasses.com")


Suggestion.create(item: jean, category: comfortable)
Suggestion.create(item: snowjacket, category: cold)
Suggestion.create(item: sunglasses, category: hot)