@proxy
Feature: Membership System

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
        "name": "Product 01",
        "original_price": 100,
        "discount_price": 89,
        "image": "product_01.png"
      }
      """

  Scenario: 01
    A user can register as a normal user
   Given the customer goes to page - "/"
    Then the customer should see "Membership System"
    When the customer clicks "Sign up"
    Then the customer should be at page - "/users/sign_up"
     And the customer fills in "Email" with "customer@test.com"
     And fills in "Password" with "customertest"
     And fills in "Password confirmation" with "customertest"
    When the customer presses "Submit"
    Then the customer should be at page - "/"
     And the customer should see "Welcome! You have signed up successfully."
     And the customer should see "Sign out ( customer@test.com )"
    When the customer clicks "Sign out"
    Then the customer should be at page - "/"
     And the customer should see "Signed out successfully."

  Scenario: 02
    A user can browse products on this website
   Given the customer goes to page - "/"
    Then the customer should see the image "product_01.png"
     And should see "Product 01"
     And should see "$100"

  Scenario: 03
    A user can choose to purchase premium membership(can skip payment)
   Given the user goes to page - "/"
     And clicks "Sign in"
    Then the user should be at page - "/users/sign_in"
    When the customer fills in "Email" with "user@test.com"
     And fills in "Password" with "usertest"
    When the user presses "Submit"
    Then the user should be at page - "/"
    When the user clicks "upgrade now"
    Then the user should be at page - "/premiums"
     And the customer should see "Premium"
     And should see "$0"
    When the user clicks "Upgrade"
     And accepts the confirm message
    Then the user should be at page - "/premiums"
     And the customer should see "Successfully upgraded."

  Scenario: 04
    A premium member can see products with discount prices
   Given the premium member goes to page - "/"
     And clicks "Sign in"
    Then the premium member should be at page - "/users/sign_in"
    When the premium member fills in "Email" with "premium@test.com"
     And fills in "Password" with "premiumtest"
    When the premium member presses "Submit"
    Then the premium member should be at page - "/"
    Then the premium member should see "Product 01"
     And should see "$100"
     And should see "$89"

  Scenario: 05
    A user can be set as admin
   Given the admin goes to page - "/"
     And clicks "Sign in"
    Then the admin should be at page - "/users/sign_in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    Then the admin should see "Backend"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    When the admin clicks "Users"
    Then the admin should be at page - "/admin/users"
    Then the admin should see "user@test.com"
    When the admin clicks "user@test.com"
    Then the admin should be at page - "/admin/users/2"
    When the admin clicks "Edit User"
    Then the admin should be at page - "/admin/users/2/edit"
     And checks the checkbox of admin
    When the admin presses "Update User"
    Then the admin should be at page - "/admin/users/2"
     And clicks "Sign out"

   Given the user goes to page - "/"
     And clicks "Sign in"
    Then the user should be at page - "/users/sign_in"
    When the customer fills in "Email" with "user@test.com"
     And fills in "Password" with "usertest"
    When the user presses "Submit"
    Then the user should be at page - "/"
    Then the user should see "Backend"
    When the user clicks "Backend"
    Then the user should be at page - "/admin/products"

  Scenario: 06
    A product would have product price/name/image(s)
    An admin can create/edit products on this website
   Given the admin goes to page - "/"
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
