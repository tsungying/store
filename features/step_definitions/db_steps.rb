Given /^a new (.+) with the following attributes:$/ do |model_name, attributes|
  resource_name = model_name.split('/').map{ |v| v.parameterize.underscore }.join('/')
  resource_class = resource_name.camelize.constantize

  parsed_attributes = JSON.parse(attributes)

  resource = case model_name
  when 'Product'
    Product.create(
      name: parsed_attributes['name'],
      original_price: parsed_attributes['original_price'],
      discount_price: parsed_attributes['discount_price'],
      image: Rails.root.join("features/images/#{parsed_attributes['image']}").open
    )
  else
    resource_class.new(parsed_attributes)
  end

  expect(resource.save).to be_truthy
end
