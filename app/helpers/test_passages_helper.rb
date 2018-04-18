module TestPassagesHelper
  def result_view(test_passage)
    if test_passage.test_passed?
      'green'
    else
      'red'
    end
  end

  def text(test_passage)
    if test_passage.test_passed?
      t('test_passage.pass')
    else
      t('test_passage.fail')
    end
  end

  def progress_bar(test_passage)
    test_passage.current_question_number*100/test_passage.test.questions.count
  end
end
