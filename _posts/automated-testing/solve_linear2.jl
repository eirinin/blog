export linear_system

function linear_system(A, b)
  (m,n) = size(A)
  if m != length(b)
    error("A and b are not compatible")
  end
  U, σ, V = svd(A)

  return V*(U'*b./σ)
end
