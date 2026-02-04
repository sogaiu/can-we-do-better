(import ./count-digits :as c)

# x and y should have the same number of digits
(defn karatsuba
  [x y]
  (assertf (= (c/count-digits x) (c/count-digits y))
           "number of digits differ for: %p and %p" x y)
  (defn helper
    [x y]
    (def n-digits (c/count-digits x))
    (when (= 1 n-digits)
      (break (* x y)))
    #
    (def n-digits (if (even? n-digits)
                    n-digits
                    (inc n-digits)))
    #
    (def pow (math/pow 10 (/ n-digits 2)))
    #
    (def a (math/floor (/ x pow)))
    (def b (- x (* pow a)))
    (def c (math/floor (/ y pow)))
    (def d (- y (* pow c)))
    #
    (def ac (helper a c))
    (def bd (helper b d))
    (def a+b_c+d (helper (+ a b) (+ c d)))
    (def gauss (- a+b_c+d ac bd))
    #
    (+ (* ac (math/pow 10 n-digits))
       (* gauss pow)
       bd))
  #
  (helper x y))

(comment

  (karatsuba 1 2)
  # =>
  2

  (karatsuba 10 20)
  # =>
  200

  (karatsuba 99 99)
  # =>
  (* 99 99)

  (karatsuba 100 100)
  # =>
  (* 100 100)

  (karatsuba 256 256)
  # =>
  (* 256 256)

  (karatsuba 1024 2048)
  # =>
  2097152

  (karatsuba 65536 65536)
  # =>
  (* 65536 65536)

  (karatsuba 131072 131072)
  # =>
  (* 131072 131072)

  (try
    (karatsuba 1 10)
    ([e]
      (string/has-prefix? "number of digits differ for" e)))
  # =>
  true

  )

