json.categories @categories.each do |category|
	json.id category.id
	json.icon category.icon
	json.name category.name
end
