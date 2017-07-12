# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(entity: "PET", department: "DETI", email: "petdeti@email.com", password: "petdeti1", role: "user")
Event.create(title: "CinePET", date: "12/06/2017", schedule: "12:00 ás 14:00", description: "Apresentaremos o filme Piratas do vale do silicio", image: "https://upload.wikimedia.org/wikipedia/pt/d/dd/Pirates_of_silicon_valley_poster_promocional.png",role: "evento", user_id: u1.id)
Event.create(title: "Curso Octave", date: "14/06/2017", schedule: "12:00 ás 14:00", description: "Venha aprender a ferramenta Octave", image: "http://m1.paperblog.com/i/266/2661286/aprendiendo-matlab-octave-upm-T-Pit7_q.png",role: "curso", user_id: u1.id)
g1 = Group.create(title: "Inglês Avançado", schedule: "18:00 ás 20:00", description: "Grupo destinado à aprender e aperfeiçoar a lingua portuguesa", image: "https://sd.keepcalm-o-matic.co.uk/i-w600/keep-calm-and-try-to-pass-advanced-english.jpg",role: "curso",  size: "10", user_id: u1.id, situation: "aberto")
Email.create(address: "carlos@gmail.com", group_id: g1.id)
Email.create(address: "yuri@hotmail.com", group_id: g1.id)



u2 = User.create(entity: "PET", department: "DC", email: "petdc@email.com", password: "petdc1", role: "user")
Event.create(title: "Palestra IOT", date: "15/06/2017", schedule: "12:00 ás 14:00", description: "Palestra IOT", image: "http://www.deal.com.br/wp-content/uploads/2017/04/Internet-of-Things.jpg",role: "palestra", user_id: u2.id)
Event.create(title: "JAVA", date: "14/06/2017", schedule: "12:00 ás 14:00", description: "Venha conhecer mais sobre JAVA!", image: "http://sidneiweber.com.br/wp-content/uploads/2015/11/Java_620X0.jpg",role:"workshop", user_id: u2.id)
g2 = Group.create(title: "Estudo dirigido: Cálculo", schedule: "12:00 ás 14:00", description: "Grupo destinado à resolução de exercícios e tira-dúvidas das disciplínas de cálculo", image: "http://www.unisinos.br/ensino-propulsor/wp-content/uploads/2015/09/livro-de-matematica-aberto_23-2147506741.jpg",role: "curso",  size: "15", user_id: u2.id, situation: "aberto")

u3 = User.create(entity: "admin", department: "admin", email: "admin@admin", password: "admin", role: "admin")
