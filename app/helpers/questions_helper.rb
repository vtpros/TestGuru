module QuestionsHelper
  def question_header(test)
    action = test.new_record? ? 'Create New' : 'Edit'
    "#{action} '#{test.title}' Question"
  end
end
