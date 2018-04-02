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
      'Test passed!'
    else
      'Test failed!'
    end
  end
end
