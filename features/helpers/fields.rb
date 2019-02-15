module FieldsHelper
  def field_id(field)
    case field
    when 'Email'
      'user_email'
    when 'Password'
      'user_password'
    when 'Password confirmation'
      'user_password_confirmation'
    when 'Product Name'
      'product_name'
    when 'Product Original Price'
      'product_original_price'
    when 'Product Discount Price'
      'product_discount_price'
    else
      field
    end
  end
end

World FieldsHelper
