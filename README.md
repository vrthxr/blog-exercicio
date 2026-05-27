# Blog — Ruby on Rails

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)

---

## About

A Rails exercise focused on data modeling, model associations and the full MVC cycle. Built from scratch as part of my jr backend studies.

## What was built

- Models with associations (`belongs_to`, `has_many`)
- Migrations with foreign keys
- Controllers with strong parameters
- Forms using `form_with` and `collection_select`
- Dashboard with an overview of all records

## Models

| Model | Associations |
|---|---|
| `User` | `has_many :articles`, `has_many :comments` |
| `Article` | `belongs_to :user`, `has_many :comments` |
| `Comment` | `belongs_to :user`, `belongs_to :article` |

## Routes

| Route | Description |
|---|---|
| `/users/new` | Create a new user |
| `/articles/new` | Create a new article |
| `/comments/new` | Add a comment |
| `/dashboard` | Overview of all records |

## Getting started

```bash
git clone https://github.com/vrthxr/blog-exercicio
cd blog-exercicio
bundle install
rails db:create db:migrate
rails server
```
