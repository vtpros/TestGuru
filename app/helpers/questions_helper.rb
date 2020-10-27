module QuestionsHelper
  METHODS = {edit: 'Edit', create: 'Create New'}.freeze

  def question_header(test, method)
    "#{METHODS[method]} '#{test.title}' Question"
  end
end
