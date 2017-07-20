# DB設計
***
## tables
### items table
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | null: false, index: true                 |
| price            | integer      | null: false                              |
| stock            | integer      | null: false                              |
| introduction     | text         | null: false                              |
| category_id      | references   | null: false, foreign_key: true           |
### Association
* has_many :reviews
* has_many :images
: has_many :shoppings
* belongs_to :category


### categories tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | null: false                              |
### Association
* has_many :items

### carts tabals
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| number           | integer      | null: false                              |
| user_id          | references   | null: false, foreign_key: true           |
| order_id         | referencds   | foreign_key: true
### Association
* belongs_to :user
* belongs_to :order
* has_many :items :through :cart_item

### shoppings
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| number           | integer      | null: false                              |
| item_id          | references   | null: false, foreign_key: true           |
| cart_id          | references   | null: false, foreign_key: true
### Association
* belongs_to :cart
* belongs_to :item
* ha_many :carts :through :shoppings

### orders tabals
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| user_id          | references   | null: false, foreign_key: true           |
| adrress_id       | references   | null: false, foreign_key: true
| pay_type         | integer      | null: false
| check_out        | boolean      | null: false
### Association
* belongs_to :user
* belongs_to :address

### reviews tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| title            | string       | null: false                              |
| text             | text         | null: false                              |
| rate             | integer      | null: false                              |
| like             | integer      |                                          |
| user_id          | references  | null: false, foreign_key: true            |
| item_id          | references  | null: false, foreign_key: true            |
### Association
* belongs_to :user
* belongs_to :item

### users tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | null: false                              |
| tel              | string       | null: false                              |
| address          | string       | null: falee                              |
### Association
* belongs_to :user
* has_many :carts
* has_many :orders
* has_many :address

### address tables
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| name             | string       | null: false                              |
| postal_code      | string       | null: false                              |
| address          | string       | null: falee                              |
| tel              | integer      | null: false
### Association
* belongs_to :user
* belongs_to :order
* has_many: orders

### images tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| image            | string       | null: false                              |
| item_id          | foreign_key  | null: false, foreign_key: true           |
### Association
* belongs_to :user
