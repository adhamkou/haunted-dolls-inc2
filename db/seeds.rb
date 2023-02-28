Doll.destroy_all
User.destroy_all

User.create!(email: 'a@a.a', password: '123456')

Doll.create!(name: 'marge', user: User.last)
Doll.create!(name: 'Johanne', user: User.last)
