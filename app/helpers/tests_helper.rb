module TestsHelper
  def test_level(test)
    levels = {'0': 'easy', '1': 'medium', '2': 'hard', '3': 'very hard'}
    levels[:"#{test.level}]"]
  end
end
