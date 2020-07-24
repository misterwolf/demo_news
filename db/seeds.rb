# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the
# db with db:setup).

User.destroy_all
user1 = User.create!(email: 'email1@example.com', password: 'password', name: 'John', lastname: 'Doe', created_at: Time.now - 1.month, updated_at: Time.now  - 15.days)
user2 = User.create!(email: 'email2@example.com', password: 'password', name: 'John', lastname: 'Who', created_at: Time.now - 15.days, updated_at: Time.now  - 1.days)
user3 = User.create!(email: 'email3@example.com', password: 'password', name: 'John', lastname: 'Connor', created_at: Time.now, updated_at: Time.now)

News.destroy_all
News.create!(author_id: user1.id, title: 'John', content: 'Someone who is not recognized', created_at: Time.now - 1.month, updated_at: Time.now  - 15.days)
News.create!(author_id: user2.id, title: 'John', content: 'He remembers me a song', created_at: Time.now - 15.days, updated_at: Time.now  - 1.days)
News.create!(author_id: user3.id, title: 'John', content: 'The leader of human resistance', created_at: Time.now, updated_at: Time.now)
