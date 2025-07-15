def caesar_cipher(input_string, shift_factor)
  caesar_cipher = ''
  cipher_codepoint = []
  input_codepoints = input_string.codepoints

  #To iterate over the codepoints and shift it accordingly
  input_codepoints.each do |codepoint|
    if codepoint_in_english_alphabet_range(codepoint)
      cipher_codepoint.push(shift_codepoint_by_shift_factor(codepoint, shift_factor))
    else 
      #Not part of english alphabet like space, question mark 
      cipher_codepoint.push(codepoint)
    end
  end
  caesar_cipher = generate_caesar_cipher(cipher_codepoint)
end

#Generate the Caesar Cipher
def generate_caesar_cipher(cipher_codepoint)
  cipher = ''
  cipher_codepoint.each {|codepoint| cipher += codepoint.chr}
  return cipher
end

#To check whether the codepoint is in range of english alphabet
def codepoint_in_english_alphabet_range(codepoint)
  if (codepoint >= 65 && codepoint <=90) || (codepoint >= 97 && codepoint <= 122)
    return true
  end
end

#To check whether the alphabet is small or capital
def check_capital_or_small_alphabet(codepoint)
  if (codepoint >= 65 && codepoint <=90)
    return "capital"
  else
    return "small"
  end
end

#To shift the codepoint of the input by the shift factor
def shift_codepoint_by_shift_factor (codepoint, shift_factor)
  character_small_or_capital = check_capital_or_small_alphabet(codepoint)
  codepoint += shift_factor
  #To wrap the character
  if codepoint_in_english_alphabet_range(codepoint)
        return codepoint 
  elsif character_small_or_capital == "capital"
    return (65 + (codepoint - 90) - 1)
  else
    return (97 + (codepoint - 122) - 1)
  end 
end