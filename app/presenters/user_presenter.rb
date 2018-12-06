class UserPresenter < SimpleDelegator

  def extract_mobile_digits 
    digits = []
    indexes = [6, 7, 8, 9]
    self.mobile_phone.split('').each_with_index{|d, i| digits << d if indexes.include?(i)}
    digits[0]+digits[1] + ' ' + digits[2]+digits[3]
  end

end
