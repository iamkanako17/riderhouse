# Riderhouse

## description
Riders can book a guest house or rider house on the trip.

## URL

## account for test

## Usage
  1. you can register as a host or an guest user.
  2. If you are a host user, you can register on guest house information.
  3. If you are a guest user,you can see the list of guest houses and make a reservation.
  4. Guest users can use the hotel while trip.

## problem-solving
  Helping riders and backpackers find cheap and fast accommodation on the road.
  For the host, we hope to contribute to the increase of users and regional revitalization.

## requirement
  * Host user registration, inn information registration function
  * User registration function
  * Regional category creation
  * Inn list display function
  * Payment, reservation function
  * Inn detatils display function

  # database
  ## host_users table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | nickname       | string       | null: false                     |
  | email          | string       | null: false, unique: true       |
  | password       | string       | null: false                     |
  | phone          | string       | null: false                     |
  | hostname       | string       | null: false                     |
  | hostname_kana  | string       | null: false                     |
  | age            | integer      | null: false                     |
  | gender         | integer      | null: false                     |
  | inn_description_id   | integer      | null: false, foreign_key: true  |

  ### association
  - has_one: inn_description

  ## lodgings table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | lodge_name     | string       | null: false                     |
  | price          | string       | null: false                     |
  | postcode       | string       | null: false                     |
  | prefecture     | integer      | null: false                     |
  | city           | string       | null: false                     |
  | block_number   | string       | null: false                     |
  | building       | string       |                                 |
  | host_user_id   | integer      | null: false                     |

  ### association
  - belongs_to: host_user

  ## guest_users table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | nickname       | string       | null: false                     |
  | email          | string       | null: false, unique: true       |
  | password       | string       | null: false                     |
  | phone          | string       | null: false                     |
  | guestname      | string       | null: false                     |
  | guestname_kana | string       | null: false                     |
  | image          | string       |                                 |

  ### association
  - has_many: reservations

  ## reservations table
  | Column         |     Type     |        Options                  |
  | -------------- | ------------ | ------------------------------- |
  | guest_user_id  | integer      | null: false                     |
  | host_user_id   | integer      | null: false                     |

  ### association
  - belongs_to: guest_user
  - belongs_to: host_user


## version
  - ruby 2.6.5
  - rails 6.0.3.2

## How to work locally
  - % git clone <coppied url from GitHub>
  - add to gem file, gem 'pry-rails'
  - bundle install
  - % rails db:create
  - % rails db:migrate
  - % rails s














