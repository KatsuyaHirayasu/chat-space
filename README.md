


#DB設計

___table___

**users**

|column|type|null|
|:--:|:--:|:--:|
|name|string|false|
-※以下、deviseを使用する

-association
 -has_many :messages
 -has_many :group_users
 -has_many :groups, through: :group_users

**groups**

|column|type|null|
|:--:|:--:|:--:|
|name|string|false|

-association
 -has_many :messages
 -has_many :group_users
 -has_many :users, through: :group_users


**messages**

|column|type|null|
|:--:|:--:|:--:|
|user_id|references|false|
|group_id|references|false|
|content|text||
|image|string||

-association
 -belongs_to :user
 -belongs_to :group

**group_users**

|column|type|null|
|:--:|:--:|:--:|
|user_id|references|false|
|group_id|references|false|

-association
 -belongs_to :user
 -belongs_to :group
