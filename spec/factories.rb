Factory.define :user do |u|
  u.forename 'eamon'
  u.surname 'skelly'
  u.email 't@test.com'
  u.password 'password'
  u.password_confirmation 'password'
  u.user_type_id 1
end 