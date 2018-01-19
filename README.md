# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Data Model

- Logins
    - belongs_to :user
- Users
    - has_many :logins
    - has_many :memberships
    - has_many :companies, through: :memberships
    - has_many :roles, through: :memberships
- Memberships
    - belongs_to :user
    - belongs_to :company
    - has_one :role
- Companies
    - has_many :memberships
    - has_many :users, through: :memberships
- Subscriptions
