module QuestionsHelper
  def question_header(question)
    test_title = question.test.title
    if question.new_record?
      "Create New #{test_title} Question"
    else
      "Edit #{test_title} Question"
    end
  end
end
