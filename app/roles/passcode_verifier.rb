class PasscodeVerifier < SimpleDelegator

  def verify_psaacode(code)
    case code
    when nil then return false
    when code.length < 6 then return false
    when !is_numeric_code?(code) then return false
    end
    Digest::SHA512.hexdigest(code) == self.pass_code
  end

  private

  def is_numeric_code?(code)
    true if Float(code) rescue false
  end

end
