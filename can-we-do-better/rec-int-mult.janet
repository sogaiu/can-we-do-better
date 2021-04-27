(import ./count-digits)

# x and y should have the same number of digits
(defn rec-int-mult
  [x y]
  (assert (= (count-digits/count-digits x)
             (count-digits/count-digits y))
          (string/format "number of digits differ for: %p and %p"
                         x y))
  (defn helper
    [x y]
    (def n-digits
      (count-digits/count-digits x))
    (when (= 1 n-digits)
      (break (* x y)))
    #
    (def n-digits
      (if (even? n-digits)
        n-digits
        (inc n-digits)))
    #
    (def pow
      (math/pow 10
                (/ n-digits 2)))
    #
    (def a
      (math/floor (/ x pow)))
    (def b
      (- x (* pow a)))
    (def c
      (math/floor (/ y pow)))
    (def d
      (- y (* pow c)))
    #
    (+ (* (math/pow 10 n-digits)
          (helper a c))
       (* pow
          (+ (helper a d)
             (helper b c)))
       (helper b d)))
  #
  (helper x y))

(comment

  (rec-int-mult 1 2)
  # => 2

  (rec-int-mult 10 20)
  # => 200

  (rec-int-mult 99 99)
  # => (* 99 99)

  (rec-int-mult 100 100)
  # => (* 100 100)

  (rec-int-mult 256 256)
  # => (* 256 256)

  (rec-int-mult 1024 2048)
  # => 2097152

  (rec-int-mult 65536 65536)
  # => (* 65536 65536)

  (rec-int-mult 131072 131072)
  # => (* 131072 131072)

  (try
    (rec-int-mult 1 10)
    ([e]
      (string/has-prefix? "number of digits differ for" e)))
  # => true

  )
