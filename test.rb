# test_calculate_grade.rb
require 'minitest/autorun'
require 'flog'
require_relative 'bad'
require_relative 'good'

class CalculateGradeTest < Minitest::Test
  def test_bad_calculate_grade
    assert_equal 'A', calculate_grade(95)
    assert_equal 'B', calculate_grade(85)
    assert_equal 'C', calculate_grade(75)
    assert_equal 'D', calculate_grade(65)
    assert_equal 'F', calculate_grade(55)
  end

  def test_good_calculate_grade
    assert_equal 'A', calculate_grade(95)
    assert_equal 'B', calculate_grade(85)
    assert_equal 'C', calculate_grade(75)
    assert_equal 'D', calculate_grade(65)
    assert_equal 'F', calculate_grade(55)
  end

  def test_flog_scores
    flog = Flog.new
    bad_flog_score = flog.flog('bad.rb').total_score
    good_flog_score = flog.flog('good.rb').total_score

    if bad_flog_score < good_flog_score
      puts "The 'bad' implementation is more performant with a Flog score of #{bad_flog_score}"
    elsif good_flog_score < bad_flog_score
      puts "The 'good' implementation is more performant with a Flog score of #{good_flog_score}"
    else
      puts "Both implementations have the same Flog score of #{bad_flog_score}"
    end
  end
end
