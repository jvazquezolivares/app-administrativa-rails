# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([{ nombre: 'lacteos', descripcion: 'leches, quesos, mantequilla y otros derivados' }, 
                        { nombre: 'calzado', descripcion: 'zapatos, botas y otros accesorios relacionados' },
                        { nombre: 'frituras', descripcion: 'botanas' }, 
                        { nombre: 'alimento para mascotas', descripcion: 'todo en alimento para mascotas' }, 
                        { nombre: 'Endulzantes', descripcion: 'Azúcar, endulzantes, mieles para endulzar' }, 
                        { nombre: 'Huevos', descripcion: 'Huevos' },
                        { nombre: 'Pastas', descripcion: 'Sopas, spaguetti, tallarines y productos relacionados' },
                        { nombre: 'Frutas', descripcion: 'Frutas' },
                        { nombre: 'Verduras', descripcion: 'Verduras' },
                        { nombre: 'Confitería', descripcion: 'Caramelos, dulces' },
                        { nombre: 'Harinas', descripcion: 'Galletas, pan' },
                        { nombre: 'Bebidas', descripcion: 'agua, bebidas en polvo, naranjadas' },
                        { nombre: 'Bebidas Alcohólicas', descripcion: 'vino, brandy, ron' }])

Client.create([{nombre: "Juan Carlos Osorio", direccion: "Cerrada de colombia 42", telefono: "9878200193" }, 
                      { nombre: "Adolfo Frías Beltrán", direccion: "Circuito interior 47", telefono: "45757869878" }, 
                      { nombre: "Alfonso Rojo de la Vega", direccion: "Obispos de ayer 76", telefono: "5432423456" },
                      { nombre: "Alfred C. Crowle", direccion: "Hitchcook con 776", telefono: "3452365645" }])

20.times do |i|
  Supplier.create(nombre: Faker::Name.name, direccion: Faker::Address.street_address, telefono: Faker::PhoneNumber.cell_phone )
end

