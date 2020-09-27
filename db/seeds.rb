# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create(
  [{name: 'Spanish'}, {name: 'Portuguese'}, {name: 'French'}]
)

tests = Test.create(
  [
    {title: 'Basic spanish', level: 0, category_id: 1},
    {title: 'Advanced spanish', level: 2, category_id: 1},
    {title: 'Basic portuguese', level: 0, category_id: 2},
    {title: 'Advanced portuguese', level: 2, category_id: 2},
    {title: 'Basic french', level: 0, category_id: 3}
  ]
)

answers = Question.create(
  [
    {body: 'A dog', test_id: 1},
    {body: 'A cat', test_id: 1},
    {body: 'I have not seen him', test_id: 2},
    {body: 'I have just called you', test_id: 2},
    {body: 'A dog', test_id: 3},
    {body: 'A cat', test_id: 3},
    {body: 'I have not seen him', test_id: 4},
    {body: 'I have just called you', test_id: 4}
  ]
)

answers = Answer.create(
  [
    {body: 'Un perro', question_id: 1, correct: 1},
    {body: 'Un gato', question_id: 1, correct: 0},
    {body: 'Un perro', question_id: 2, correct: 0},
    {body: 'Un gato', question_id: 2, correct: 1},
    {body: 'No lo he visto', question_id: 3, correct: 1},
    {body: 'No lo vi', question_id: 3, correct: 0},
    {body: 'Te he llegado', question_id: 4, correct: 1},
    {body: 'Te llego', question_id: 4, correct: 0},
    {body: 'Um cão', question_id: 5, correct: 1},
    {body: 'Um gato', question_id: 5, correct: 0},
    {body: 'Um cão', question_id: 6, correct: 0},
    {body: 'Um gato', question_id: 6, correct: 1},
    {body: 'Não te vi', question_id: 7, correct: 1},
    {body: 'Não te oi', question_id: 7, correct: 0},
    {body: 'Acabei de te ligar', question_id: 8, correct: 1},
    {body: 'Te liguei', question_id: 8, correct: 0}
  ]
)

users = User.create(
  [{name: 'Vladimir'}]
)

usertests = UserTest.create(
  [{result: nil, completed: false, user_id: 1, test_id: 1}]
)
