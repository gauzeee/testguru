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
end
