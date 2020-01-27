path = File.join(File.dirname(__FILE__), "./seed_files/SpocketProducts.json")
records = JSON.parse(File.read(path))
records.each do |record|
  country = Country.find_or_create_by(name: record['country']) 
  product = Product.create(name: record['title'], description: record['description'], price: record['price'], country: country)
  tags = record['tags'].split(',').map do |t|
    tag = Tag.find_or_create_by(name: t.strip) 
    tag
  end
  product.update(tags: tags)
end
