# Blog — Ruby on Rails

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=for-the-badge&logo=ruby&logoColor=white)
![Rails](https://img.shields.io/badge/Rails-CC0000?style=for-the-badge&logo=rubyonrails&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white)

---

## About

A Rails exercise focused on data modeling, model associations and the full MVC cycle. Built from scratch as part of my jr backend studies.

Also includes earlier exercises from the same course: a home page with hardcoded posts and a student listing page, both using Bootstrap components.

## What was built

- Models with associations (`belongs_to`, `has_many`)
- Migrations with foreign keys
- Controllers with strong parameters
- Forms using `form_with` and `collection_select`
- Dashboard with an overview of all records
- Bootstrap layout with shared navbar partial
- Devise authentication (sign up, login, logout)
- Post ownership — only the author can edit or delete their own posts
- View counter per post
- Nested comments on posts with Action Text (rich text)
- Comment ownership — only the author can edit or delete their own comments
- Inline comment editing with Stimulus
- Home page and student listing (data hardcoded, for practice)

## Models

| Model | Associations |
|---|---|
| `User` | `has_many :posts`, `has_many :comments` |
| `Post` | `belongs_to :user`, `has_many :comments` |
| `Comment` | `belongs_to :user`, `belongs_to :post`, `has_rich_text :body` |

## Routes

| Route | Description |
|---|---|
| `/` | Home |
| `/posts` | List of posts |
| `/posts/new` | Create a new post (requires login) |
| `/posts/:id/comments` | Create a comment on a post (requires login) |
| `/posts/:id/comments/:id` | Edit or delete a comment (requires login) |
| `/users/sign_up` | Sign up |
| `/users/sign_in` | Login |
| `/student` | Student listing |
| `/dashboard` | Overview of all records |

## Getting started

```bash
git clone https://github.com/vrthxr/blog-exercicio
cd blog-exercicio
bundle install
rails db:create db:migrate
rails server
```
