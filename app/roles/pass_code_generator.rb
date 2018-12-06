
class PassCodeGenerator < SimpleDelegator

  def generate_passcode
    o = [(0..9)].map { |i| i.to_a }.flatten
    pass_code = (0...6).map { o[rand(o.length)] }.join
  end

end
