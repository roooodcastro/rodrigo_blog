# frozen_string_literal: true

if User.all.empty?
  # That password is temporary, don't even try
  User.create name: 'Rodrigo Castro', email: 'rod.c.azevedo@gmail.com',
              password: '123456', admin: true, poster: true
end
