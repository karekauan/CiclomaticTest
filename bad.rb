def calculate_grade(score)
    if score >= 90 && score <= 100
      'A'
    elsif score >= 80 && score < 90
      'B'
    elsif score >= 70 && score < 80
      'C'
    elsif score >= 60 && score < 70
      'D'
    else
      'F'
    end
end