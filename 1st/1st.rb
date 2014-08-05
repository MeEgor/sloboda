# C[n] - Regular Bracket sequence made from N opening brackets and N closing brackets.
# C[n] = X
# Let is X = (A)B,
# where A and B - Regular Bracket sequences.
# So A = C[k], B = C[n-1-k]
# C[n] = C[k]C[n-k-1]



class BracketVariants
  def initialize n
    @sequence = [1] # C[0] = 1
    # to find C[n], first we need to find C[n-1]
    for m in 1..n
      @sequence[m] = 0
      for k in 0..m-1
        @sequence[m] += @sequence[k] * @sequence[m-1-k]
      end
    end
  end

  def to_i
    @sequence.last.to_i
  end

  def to_a
    @sequence
  end

  def to_s
    @sequence.to_s
  end
end



