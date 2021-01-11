# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin = User.find_by(email: 'fernando.flores1961@gmail.com')
if admin.nil?
  User.create!(name:                    "Luis Fernando Flores",
               email:                   "fernando.flores1961@gmail.com",
               password:                "fernando96",
               password_confirmation:   "fernando96")
end


mensajes = {'cumpleaños' => "Mensaje de cumpleaños", 'notificación' => "Mensaje para notificación de cumpleaños"}
mensajes.each do |tip, mens|
  Mensaje.create!(tipo: tip, texto: mens)
end

numero = 100

notarios = [
  {
   nombre: 'Pepe Mamertini',
   email: 'mamertini@gmail.com',
   fechaNacimiento: '2020-12-03',
   presidente: false,
   fiat_supernumerario: '2010-11-04',
   fiat_notario_titular: '2010-11-20',
   asamblea_aceptacion: '2010-11-20',
   inicio_ejercicio: '2010-11-20',
   revocacion_fiat: '',
   motivo_revocacion: ''
  },
  {
    nombre: 'Alfredo Jaliffe',
    email: 'jaladiffe@gmail.com',
    fechaNacimiento: '2020-01-03',
    presidente: false,
    fiat_supernumerario: '2011-11-04',
    fiat_notario_titular: '2011-11-20',
    asamblea_aceptacion: '2011-11-20',
    inicio_ejercicio: '2011-11-20',
    revocacion_fiat: '',
    motivo_revocacion: ''
   },
   {
    nombre: 'Juan Perrucho Olindo',
    email: 'perrucho.olindo@gmail.com',
    fechaNacimiento: '2020-04-13',
    presidente: false,
    fiat_supernumerario: '2011-11-04',
    fiat_notario_titular: '2011-11-20',
    asamblea_aceptacion: '2011-11-20',
    inicio_ejercicio: '2011-11-20',
    revocacion_fiat: '',
    motivo_revocacion: ''
   },
   {
    nombre: 'Pepe El Toro',
    email: 'soy.inocente@gmail.com',
    fechaNacimiento: '2020-08-23',
    presidente: false,
    fiat_supernumerario: '2012-11-04',
    fiat_notario_titular: '2012-11-20',
    asamblea_aceptacion: '2012-11-20',
    inicio_ejercicio: '2012-11-20',
    revocacion_fiat: '',
    motivo_revocacion: ''
   },
   {
    nombre: 'Tomás Regalado',
    email: 'regalado@gmail.com',
    fechaNacimiento: '2020-10-08',
    presidente: false,
    fiat_supernumerario: '2013-11-04',
    fiat_notario_titular: '2013-11-20',
    asamblea_aceptacion: '2013-11-20',
    inicio_ejercicio: '2013-11-20',
    revocacion_fiat: '',
    motivo_revocacion: ''
   },
   {
    nombre: 'Elmer Opreceiso',
    email: 'elmer.gon@gmail.com',
    fechaNacimiento: '2020-02-10',
    presidente: true,
    fiat_supernumerario: '201-11-04',
    fiat_notario_titular: '2014-11-20',
    asamblea_aceptacion: '2014-11-20',
    inicio_ejercicio: '2014-11-20',
    revocacion_fiat: '',
    motivo_revocacion: ''
   }
]

notarios.each do |notario|
  numero += 1
  # notario[:numero] = numero
  
  # fiatNumerario = Date.parse(notario[:fiat_notario_titular])
  
  # puts "#{notario[:numero]} - #{notario[:nombre]} #{notario[:email]} #{fiatNumerario}"
  
  Member.create!(
    numero: numero,
    nombre: notario[:nombre],
    email: notario[:email],
    fechaNacimiento: Date.parse(notario[:fechaNacimiento]),
    presidente: notario[:email] == 'elmer.gon@gmail.com'? true : false,
    fiat_supernumerario: Date.parse(notario[:fiat_supernumerario]),
    fiat_notario_titular: Date.parse(notario[:fiat_notario_titular]),
    asamblea_aceptacion: Date.parse(notario[:asamblea_aceptacion]),
    inicio_ejercicio: Date.parse(notario[:inicio_ejercicio]),
    revocacion_fiat: '',
    motivo_revocacion: ''
  )

end