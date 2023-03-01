require "open-uri"

Doll.destroy_all
User.destroy_all

owner_one = User.create!(first_name: 'Ayat', last_name: 'Amin', email: 'a@a.a', password: '123456')
owner_two = User.create(first_name: 'Maggie', last_name: 'Hum', email: 'a@b.a', password: '1234567')
owner_three = User.create(first_name: 'You', last_name: 'Pan', email: 'a@c.a', password: '12345678')

p 'created three owners'

doll1 = Doll.new(name: 'Scary Marge',
                 description: 'Shes loves to scream in the middle of the night',
                 price: 19,
                 location: 'Toronto',
                 user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image1.png")
doll1.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll1.save!

doll2 = Doll.new(name: 'Creepy Pete',
             description: 'He tends to scratch walls all night long',
             price: 80,
             location: 'Montreal',
             user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image2.png")
doll2.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll2.save!

doll3 = Doll.new(name: 'Grumpy Gertrude',
             description: 'She stinks up the place all while lauighing',
             price: 70,
             location: 'Chicago',
             user: owner_three)
file = File.open("#{Rails.root}/app/assets/images/image3.png")
doll3.image.attach(io: file, filename: "nes.png", content_type: "image/png")
doll3.save!

images = [
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677615112/development/fk5bu0dcok9wv4quu6tufhw1m3ym.webp',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677617010/development/1qs3fpfro82ifg9dnbutdmqx4z7g.webp',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677617544/production/mzecmu665oighpqn8m70br6u4irc.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677624521/production/kzjp1lur6c56x3x81fvfpk6s8ij3.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677624393/production/8id6z47bhixr9zhtr4kga114n9vi.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677624007/production/ysx8esd0wyz977pejj22cxmwi2t8.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699471/photo-1612506001235-f0d0892aa11b_k1coc3.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699516/photo-1613626253486-e2d1d9fd9bc9_yma2cs.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699562/photo-1551875671-d593541a4b84_psnu8a.jpg'
]

images2 = [
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699589/photo-1583334506779-8f63fae3d11d_x0phys.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699620/photo-1596215516573-fdeebc0b6070_e9syfa.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677699653/photo-1467103789230-f91a5ff8048a_lvn86a.jpg',
  # 'https://images.unsplash.com/photo-1611787640581-a28e60ebaba6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjB8fGRvbGxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700302/photo-1512839112604-a05d02098d9e_ywb1xh.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700384/photo-1583656391619-488983c384e6_rpj8lr.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700555/photo-1635364796711-7018d19e5e58_ynba0d.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700585/photo-1519892338195-90abfe1f6984_qnjumi.jpg',
  'https://res.cloudinary.com/dd1e1q8xa/image/upload/v1677700618/photo-1533662958083-61eb6094138c_knbfle.jpg'
]

images.each do |image|
  doll = Doll.new(
    name: Faker::Name.female_first_name,
    price: Faker::Commerce.price,
    description: Faker::Movies::Hobbit.quote,
    location: Faker::Movies::Hobbit.location,
    user: owner_one
  )
  file = URI.open(image)
  doll.image.attach(io: file, filename: "nes.png", content_type: "image/png")
  doll.save!
  p "Doll with id #{doll.id}"
end

images2.each do |image|
  doll = Doll.new(
    name: Faker::Name.female_first_name,
    price: Faker::Commerce.price,
    description: Faker::Movies::Hobbit.quote,
    location: Faker::Movies::Hobbit.location,
    user: owner_two
  )
  file = URI.open(image)
  doll.image.attach(io: file, filename: "nes.png", content_type: "image/png")
  doll.save!
end
