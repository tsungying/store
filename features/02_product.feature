@proxy
Feature: 02 - Product

  Background:
    Given a new User with the following attributes:
      """
      {
        "email": "admin@test.com",
        "admin": true,
        "premium": false,
        "password": "admintest"
      }
      """
    Given a new User with the following attributes:
      """
      {
        "email": "user@test.com",
        "admin": false,
        "premium": false,
        "password": "usertest"
      }
      """
    Given a new User with the following attributes:
      """
      {
        "email": "premium@test.com",
        "admin": false,
        "premium": true,
        "password": "premiumtest"
      }
      """
    Given a new Product with the following attributes:
      """
      {
        "name": "Test Product 01",
        "original_price": 100,
        "discount_price": 89,
        "image": "product_01.png"
      }
      """

  Scenario: 02_01
    Display error messages if required fields are blank
   Given the admin is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    When the admin clicks "Create Product"
    Then the admin should be at page - "/admin/products/new"
    When the admin presses "Create Product"
     And the admin should see "Name can't be blank"

  Scenario: 02_02
    Display error messages if the discount price is greater than the original price
   Given the admin is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    When the admin clicks "Create Product"
    Then the admin should be at page - "/admin/products/new"
     And the admin fills in "Product Name" with "Product 02"
     And fills in "Product Original Price" with "999"
     And fills in "Product Discount Price" with "1200"
    When the admin presses "Create Product"
     And the admin should see "Discount price must be less than or equal to 999"

  Scenario: 02_03
    A product would have product price/name/image(s)
    An admin can create products on this website
   Given the admin is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    When the admin clicks "Create Product"
    Then the admin should be at page - "/admin/products/new"
     And the admin fills in "Product Name" with "Product 02"
     And fills in "Product Original Price" with "1200"
     And fills in "Product Discount Price" with "999"
     And attach the file "features/images/product_02.jpg" to image field
    When the user presses "Create Product"
    Then the admin should be at page - "/admin/products"
    When the admin goes to page - "/"
    Then the admin should see the image "product_02.jpg"
     And should see "Product 02"
     And should see "$1200"

  Scenario: 02_04
    An admin can edit products on this website
   Given the admin is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
     And should see "Test Product 01"
     And should see "100"
     And should see "89"
    Then the admin should see the image "product_01.png"
    When the admin clicks "Test Product 01"
    Then the admin should be at page - "/admin/products/1"
    When the admin clicks "Edit Product"
    Then the admin should be at page - "/admin/products/1/edit"
     And the admin fills in "Product Name" with ""
    When the admin presses "Update Product"
     And the admin should see "Name can't be blank"
     And the admin fills in "Product Name" with "Update Test Product 01"
     And fills in "Product Original Price" with "500"
     And fills in "Product Discount Price" with "250"
     And attach the file "features/images/product_02.jpg" to image field
    When the admin presses "Update Product"
    Then the admin should be at page - "/admin/products/1"
     And should see "Update Test Product 01"
     And should see "500"
     And should see "250"
    Then the admin should see the image "product_02.jpg"

  Scenario: 02_05
    Test pagination feature on product page
    Given there are "25" products on the website
    Given the admin is at the home page - "/"
    Then the admin should see "Next ›"
    When the admin clicks "Next ›"
    Then the admin should be at page - "/?page=2"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    Then the admin should see "Next ›"
    When the admin clicks "Next ›"
    Then the admin should be at page - "/admin/products?page=2"
