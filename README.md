# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| profile            | text     | null: false |
| occupation         | text     | null: false |
| position           | text     | null: false |
| created_at         | datetime | null: false |
| updated_at         | datetime | null: false |

### Association

- has_many :prototypes, dependent: :destroy
- has_many :comments, dependent: :destroy

## prototypes テーブル
| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| title              | string   | null: false |
| catch_copy         | text     | null: false |
| concept            | text     | null: false |
| user_id            | bigint   | null: false |
| created_at         | datetime | null: false |
| updated_at         | datetime | null: false |

### Association

- belongs_to :user
- has_many :comments, dependent: :destroy

## comments テーブル
| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| content            | text     | null: false |
| prototype_id       | bigint   | null: false |
| user_id            | bigint   | null: false |
| created_at         | datetime | null: false |
| updated_at         | datetime | null: false |

### Association

- belongs_to :user
- belongs_to :prototype