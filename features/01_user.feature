@proxy
Feature: 01 - User
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

  Scenario: 01_01
    Display error messages if required fields are blank
   Given the customer goes to page - "/"
    Then the customer should see "Membership System"
    When the customer clicks "Sign up"
    Then the customer should be at page - "/users/sign_up"
    When the customer presses "Submit"
     And the customer should see "Please review the problems below:"
     And the customer should see "Email can't be blank"
     And the customer should see "Password can't be blank"

  Scenario: 01_02
    Display error messages if the email has been taken
    Given the customer is at the sign up page - "/users/sign_up"
     And the customer fills in "Email" with "user@test.com"
     And fills in "Password" with "customertest"
     And fills in "Password confirmation" with "customertest"
    When the customer presses "Submit"
     And the customer should see "Please review the problems below:"
     And the customer should see "Email has already been taken"

  Scenario: 01_03
    A customer can register as a normal user
    Given the customer is at the sign up page - "/users/sign_up"
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

  Scenario: 01_04
    A user can be set as admin
   Given the admin is at the sign in page - "/users/sign_in"
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

  Scenario: 01_05
    A user can choose to purchase premium membership(can skip payment)
   Given the user is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    Then the user should be at page - "/users/sign_in"
    When the customer fills in "Email" with "user@test.com"
     And fills in "Password" with "usertest"
    When the user presses "Submit"
    Then the user should be at page - "/"
    Then the user should see "Upgrade to Premium"
    When the user clicks "Upgrade to Premium"
    Then the user should be at page - "/users/upgrade_information"
     And the customer should see "Become a Premium Member"
     And the customer should see "Offering discounts on all products"
    When the user clicks "upgrade now"
     And accepts the confirm message
     And the customer should see "Successfully upgraded."
    Then the premium member should see "Product 01"
     And should see "$100"
     And should see "$89"

  Scenario: 01_06
    A user faild to purchase premium membership
   Given the user is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    Then the user should be at page - "/users/sign_in"
    When the customer fills in "Email" with "user@test.com"
     And fills in "Password" with "usertest"
    When the user presses "Submit"
    Then the user should be at page - "/"
    Then the user should see "Upgrade to Premium"
    When the user clicks "Upgrade to Premium"
    Then the user should be at page - "/users/upgrade_information"
     And the customer should see "Become a Premium Member"
     And the customer should see "Offering discounts on all products"
   Given the upgrade feature is broken
    When the user clicks "upgrade now"
     And accepts the confirm message
    Then the user should be at page - "/users/upgrade_information"
     And the customer should see "Failed to upgrade, please contact your admin."

  Scenario: 01_07
    Email can't be blank when the admin edits user's information
   Given the admin is at the sign in page - "/users/sign_in"
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
    When the customer fills in "Email" with ""
    When the user presses "Update User"
    Then the user should see "Email can't be blank"

  Scenario: 01_08
    Test pagination feature on admin user page
    Given there are "25" users on the website
    Given the admin is at the sign in page - "/users/sign_in"
     And clicks "Sign in"
    When the admin fills in "Email" with "admin@test.com"
     And fills in "Password" with "admintest"
    When the admin presses "Submit"
    Then the admin should be at page - "/"
    When the admin clicks "Backend"
    Then the admin should be at page - "/admin/products"
    When the admin clicks "Users"
    Then the admin should see "Next ›"
    When the admin clicks "Next ›"
    Then the admin should be at page - "/admin/users?page=2"
