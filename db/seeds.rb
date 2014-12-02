require 'csv'    

CSV.foreach(Rails.root.join('db', 'users.csv'), {headers: true, header_converters: :symbol}) do |row|
	User.create(row.to_hash)
end

CSV.foreach(Rails.root.join('db', 'items.csv'), {headers: true, header_converters: :symbol}) do |row|
	Item.create({name: row[:name], image: File.open(row[:image_path])})
end

CSV.foreach(Rails.root.join('db', 'temp_category.csv'), {headers: true, header_converters: :symbol}) do |row|
	Category.create(row.to_hash)
end

CSV.foreach(Rails.root.join('db', 'temp_scope.csv'), {headers: true, header_converters: :symbol}) do |row|
	# puts row[:category]
	# p Category.find_by(name: row[:category])
	Category.find_by(name: row[:category]).scope = Scope.create({minimum: row[:minimum].to_i, maximum: row[:maximum].to_i})
end

CSV.foreach(Rails.root.join('db', 'suggestions.csv'), {headers: true, header_converters: :symbol}) do |row|
	Suggestion.create(item_id: Item.find_by(name: row[:item]).id, category_id: Category.find_by(name: row[:category]).id)
end
