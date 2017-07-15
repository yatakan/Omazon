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
* has_many :carts :through :shoppings
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
| name             | string       | null: false                              |
| number           | integer      | null: false                              |
| price            | integer      | null: false                              |
| total            | integer      | null: false                              |
| user_id          | references   | null: false, foreign_key: true           |
### Association
* has_many :items :through :shoppings
* belongs_to :user

### shoppings tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| item_id          | foreign_key  | null: false, foreign_key: true           |
| order_id         | foreign_key  | null: false, foreign_key: true           |
### Association
* belongs_to :cart
* belongs_to :item

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
* has_one :cart

### images tabale
| column           | Type         | Options                                  |
|:-----------------|:-------------|:-----------------------------------------|
| image            | string       | null: false                              |
| item_id          | foreign_key  | null: false, foreign_key: true           |
### Association
* belongs_to :user
