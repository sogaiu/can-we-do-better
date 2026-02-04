(defn count-digits
  ``
  Count the number of digits in an integer `x`.
  ``
  [x]
  (assertf (int? x) "expected an integer, got: %p" x)
  (when (= x 0)
    (break 1))
  #
  (-> (math/abs x)
      math/log10
      math/floor
      inc))

(comment

  (count-digits 0)
  # =>
  1

  (count-digits 1)
  # =>
  1

  (count-digits 9)
  # =>
  1

  (count-digits 10)
  # =>
  2

  (count-digits 12)
  # =>
  2

  (count-digits 99)
  # =>
  2

  (count-digits 100)
  # =>
  3

  (count-digits 101)
  # =>
  3

  (count-digits -1)
  # =>
  1

  (count-digits -9)
  # =>
  1

  (count-digits -10)
  # =>
  2

  (count-digits -11)
  # =>
  2

  (try
    (count-digits 1.5)
    ([e] e))
  # =>
  "expected an integer, got: 1.5"

  )

