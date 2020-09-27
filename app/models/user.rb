class User < ApplicationRecord
  def tests_by_level(level)
    tests = []
    UserTest.where(user_id: self.id).to_a.each do |usertest|
      tests += (Test.where(id: usertest.test_id, level: level).to_a)
    end
    tests
  end
end
