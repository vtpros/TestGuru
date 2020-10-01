# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!(
  [{name: 'Spanish'}, {name: 'Portuguese'}, {name: 'French'}]
)

users = User.create!(
  [{name: 'Vladimir', username: 'vladimir', password: '123', email: 'v@v.com'}]
)

tests = Test.create!(
  [
    {title: 'Basic spanish', level: 0, category_id: categories[0].id, author_id: users[0].id},
    {title: 'Advanced spanish', level: 2, category_id: categories[0].id, author_id: users[0].id},
    {title: 'Basic portuguese', level: 0, category_id: categories[1].id, author_id: users[0].id},
    {title: 'Advanced portuguese', level: 2, category_id: categories[1].id, author_id: users[0].id},
    {title: 'Basic french', level: 0, category_id: categories[2].id, author_id: users[0].id}
  ]
)

questions = Question.create!(
  [
    {body: 'A dog', test_id: tests[0].id},
    {body: 'A cat', test_id: tests[0].id},
    {body: 'I have not seen him', test_id: tests[1].id},
    {body: 'I have just called you', test_id: tests[1].id},
    {body: 'A dog', test_id: tests[2].id},
    {body: 'A cat', test_id: tests[2].id},
    {body: 'I have not seen him', test_id: tests[3].id},
    {body: 'I have just called you', test_id: tests[3].id}
  ]
)

answers = Answer.create!(
  [
    {body: 'Un perro', question_id: questions[0].id, correct: true},
    {body: 'Un gato', question_id: questions[0].id, correct: false},
    {body: 'Un perro', question_id: questions[1].id, correct: false},
    {body: 'Un gato', question_id: questions[1].id, correct: true},
    {body: 'No lo he visto', question_id: questions[2].id, correct: true},
    {body: 'No lo vi', question_id: questions[2].id, correct: false},
    {body: 'Te he llegado', question_id: questions[3].id, correct: true},
    {body: 'Te llego', question_id: questions[3].id, correct: false},
    {body: 'Um cão', question_id: questions[4].id, correct: true},
    {body: 'Um gato', question_id: questions[4].id, correct: false},
    {body: 'Um cão', question_id: questions[5].id, correct: false},
    {body: 'Um gato', question_id: questions[5].id, correct: true},
    {body: 'Não te vi', question_id: questions[6].id, correct: true},
    {body: 'Não te oi', question_id: questions[6].id, correct: false},
    {body: 'Acabei de te ligar', question_id: questions[7].id, correct: true},
    {body: 'Te liguei', question_id: questions[7].id, correct: false}
  ]
)

usertests = UserTest.create!(
  [{result: nil, completed: false, user_id: users[0].id, test_id: tests[0].id}]
)
