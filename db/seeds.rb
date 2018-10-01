# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Setting.first_or_create({
  telephone: '07933446549',
  contact_email: 'info@mindfullifetherapy.co.uk',
  office_address_line_1: '10 Newton Place',
  office_address_line_2: '',
  office_address_line_3: '',
  office_address_city: 'Glasgow',
  office_address_postcode: 'G3 7PR',
  session_rate: '£55 per 50 minutes'
})

AboutPage.first_or_create({
  title: 'About Mindful Life Therapy',
  meta_description: 'hello',
  body: 'hello'
})
