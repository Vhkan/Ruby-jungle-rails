# Jungle
A mini e-commerce application built with Rails 6.1, PostgreSQL, Bootstrap.
The application was developed using the Test-Driven Development (TDD) approach, incorporating Rspec and Cypress for testing purposes.

## Application Features
#### User
- Can sign up and log in to the page
- Choose among Jungle plants categories and filter items accordingly
- Add items to the cart
- Increase / Decrease the items cart quantity by clicking on + / -
- Pay for chosen items using the card provided for testing purposes below

#### Admin
- Can create / delete / update Jungle plants categories and items
- View Jungle app promotions

##### Admin credentials
Name: Jungle / Password: book


## Setup
1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database
If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing
Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
Month: any 2 digits / Year: any 2 digits / CVV: any 3 digits

More information in their docs: <https://stripe.com/docs/testing#cards>

## Final Product
![Home Page](https:// "Home Page")
![Home Page](https:// "Home Page")
![Home Page](https:// "Home Page")
![Home Page](https:// "Home Page")
![Home Page](https:// "Home Page")


## Dependencies
- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe