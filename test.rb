# test_calculate_grade.rb
require 'minitest/autorun'
require 'flog'
require_relative 'bad'
require_relative 'good'

class CalculateGradeTest < Minitest::Test
  def test_bad_calculate_grade
    assert_equal 'A', bad_calculate_grade(95)
    assert_equal 'B', bad_calculate_grade(85)
    assert_equal 'C', bad_calculate_grade(75)
    assert_equal 'D', bad_calculate_grade(65)
    assert_equal 'F', bad_calculate_grade(55)
  end

  def test_good_calculate_grade
    assert_equal 'A', good_calculate_grade(95)
    assert_equal 'B', good_calculate_grade(85)
    assert_equal 'C', good_calculate_grade(75)
    assert_equal 'D', good_calculate_grade(65)
    assert_equal 'F', good_calculate_grade(55)
  end

  def test_flog_scores
    bad_flog_score = Flog.calculate_score('bad.rb')
    good_flog_score = Flog.calculate_score('good.rb')
    assert bad_flog_score > good_flog_score
  end
end
