(defn count-digits
  ``Count the number of digits in an integer `x`.``
  [x]
  (assert (int? x)
          (string/format "expected an integer, got: %p" x))
  (when (= x 0)
    (break 1))
  (var ax (math/abs x))
  (var n 1)
  (var power 10)
  (while true
    (when (< ax power)
      (break))
    (++ n)
    (*= power 10))
  n)

(comment

  (count-digits 0)
  # => 1

  (count-digits 1)
  # => 1

  (count-digits 9)
  # => 1

  (count-digits 10)
  # => 2
  
  (count-digits 12)
  # => 2

  (count-digits 99)
  # => 2

  (count-digits 100)
  # => 3

  (count-digits 101)
  # => 3

  (count-digits -1)
  # => 1

  (count-digits -9)
  # => 1

  (count-digits -10)
  # => 2

  (count-digits -11)
  # => 2
  
  (try
    (count-digits 1.5)
    ([e] e ))
  # => "expected an integer, got: 1.5"

  )
