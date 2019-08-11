# README
## Users table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|integer|null: false, unique: true|
|profile|string|null: false, unique: true|
|avatar|string|null: false|
|entry|integer|

### Association
- has_one_attached :avatar
- acts_as_followable
- acts_as_follower  
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy

## Rooms table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|entry|references|null: false, foreign_key: true|


### Association
- belongs_to :user
- has_many :messages, dependent: :destroy
- has_many :entries, dependent: :destroy


## Entries table

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|room|references|null: false, foreign_key: true|



### Association
- belongs_to :user
- belongs_to :room

## Messages table

|Column|Type|Options|
|------|----|-------|
|number|integer|null: false, unique: true|
|user|references|null: false, foreign_key: true|
|room|references|null: false, foreign_key: true|
|message|text|

### Association
- belongs_to :user
- belongs_to :room


## Follows table
|Column|Type|Options|
|------|----|-------|
|followable|references|null: false, foreign_key: true|
|follower|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product



## Tweets table

|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|tweet|text|



### Association
- belongs_to :user



## Comments table
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|tweet|references|null: false,foreign_key: true|
|tweet|comment|



### Association
- belongs_to :user
- belongs_to :tweet

## enum
- enum users, :status


## ER図
-