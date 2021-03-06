# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!(
  [{ name: 'Spanish' }, { name: 'Portuguese' }, { name: 'French' }]
)

users = User.create!(
  [
    { type: Admin, first_name: 'Vladimir', last_name: 'T', email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASS'] },
    { type: User, first_name: 'Vladimir', last_name: 'T', email: ENV['USER_EMAIL'], password: ENV['USER_PASS'] }
  ]
)
users.each(&:confirm)

tests = Test.create!(
  [
    { title: 'Basic spanish', level: 1, category: categories[0], author: users[0] },
    { title: 'Advanced spanish', level: 2, category: categories[0], author: users[0] },
    { title: 'Basic portuguese', level: 1, category: categories[1], author: users[0] },
    { title: 'Advanced portuguese', level: 5, category: categories[1], author: users[0] },
    { title: 'Basic french', level: 3, category: categories[2], author: users[0] }
  ]
)

questions = Question.create!(
  [
    { body: 'A dog', test: tests[0] },
    { body: 'A cat', test: tests[0] },
    { body: 'I have not seen him', test: tests[1] },
    { body: 'I have just called you', test: tests[1] },
    { body: 'A dog', test: tests[2] },
    { body: 'A cat', test: tests[2] },
    { body: 'I have not seen him', test: tests[3] },
    { body: 'I have just called you', test: tests[3] }
  ]
)

answers = Answer.create!(
  [
    { body: 'Un perro', question: questions[0], correct: true },
    { body: 'Un gato', question: questions[0], correct: false },
    { body: 'Una casa', question: questions[0], correct: false },
    { body: 'Un cielo', question: questions[0], correct: false },
    { body: 'Un perro', question: questions[1], correct: false },
    { body: 'Un gato', question: questions[1], correct: true },
    { body: 'No lo he visto', question: questions[2], correct: true },
    { body: 'No lo vi', question: questions[2], correct: false },
    { body: 'Te he llegado', question: questions[3], correct: true },
    { body: 'Te llego', question: questions[3], correct: false },
    { body: 'Um cão', question: questions[4], correct: true },
    { body: 'Um gato', question: questions[4], correct: false },
    { body: 'Um cão', question: questions[5], correct: false },
    { body: 'Um gato', question: questions[5], correct: true },
    { body: 'Não te vi', question: questions[6], correct: true },
    { body: 'Não te oi', question: questions[6], correct: false },
    { body: 'Acabei de te ligar', question: questions[7], correct: true },
    { body: 'Te liguei', question: questions[7], correct: false }
  ]
)
